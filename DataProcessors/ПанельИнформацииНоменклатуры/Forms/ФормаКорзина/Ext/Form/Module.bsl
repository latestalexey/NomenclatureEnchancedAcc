﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АдресКорзиныВХранилище") И ЗначениеЗаполнено(Параметры.АдресКорзиныВХранилище) Тогда
		ТаблицаДляЗагрузки = ПолучитьИзВременногоХранилища(Параметры.АдресКорзиныВХранилище);
		Корзина.Загрузить(ТаблицаДляЗагрузки);
	КонецЕсли;
	Если Параметры.Свойство("ПоказыватьЦены") Тогда
		ПоказыватьЦены = Параметры.ПоказыватьЦены;
	КонецЕсли;
	Если Параметры.Свойство("ОтборТипЦен") Тогда
		ОтборТипЦен = Параметры.ОтборТипЦен;
	КонецЕсли;
	Если Параметры.Свойство("ОтборСклад") Тогда
		ОтборСклад = Параметры.ОтборСклад;
	КонецЕсли;
	Если Параметры.Свойство("ОтборОрганизация") Тогда
		ОтборОрганизация = Параметры.ОтборОрганизация;
	КонецЕсли;
	
	ОбновитьИтогиПодобранныхТоваров(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, СтандартнаяОбработка)
	
	Если НЕ РазрешитьЗакрытие Тогда
		Отказ=Истина;
		ПодключитьОбработчикОжидания("ЗакрытьФормуПеренестиКорзину", 0.1, Истина);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗакрытьФормуПеренестиКорзину() Экспорт
	
	РазрешитьЗакрытие = Истина;
	Если ПеренестиВДокумент Тогда
		Закрыть("ПеренестиВДокумент");
	Иначе
		СтруктураЗакрытия = Новый Структура("Корзина", Корзина);
		Закрыть(СтруктураЗакрытия);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область РаботаСКорзиной

&НаКлиенте
Процедура КорзинаЦенаКоличествоПриИзменении(Элемент)
	
	СтрокаКорзины = Элементы.Корзина.ТекущиеДанные;
	ОбработкаТабличныхЧастейКлиентСервер.РассчитатьСуммуТабЧасти(СтрокаКорзины);
	ОбработкаТабличныхЧастейКлиентСервер.РассчитатьСуммуНДСТабЧасти(СтрокаКорзины);
	ОбновитьИтогиПодобранныхТоваров(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ОчиститьКорзину(Команда)
	
	Корзина.Очистить();
	Закрыть();
	
КонецПроцедуры

&НаКлиенте
Процедура ПродолжитьПодбор()
	
	СтруктураЗакрытия = Новый Структура("Корзина, ПеренестиВДокумент", Корзина, ПеренестиВДокумент);
	Закрыть(СтруктураЗакрытия);
	
КонецПроцедуры

&НаКлиенте
Процедура КорзинаПриИзменении(Элемент)
	
	ОбновитьИтогиПодобранныхТоваров(ЭтаФорма);
	
КонецПроцедуры

//Обновляет итоги подобранных товаров в форме Корзина справочника Номенклатура
&НаКлиентеНаСервереБезКонтекста
Процедура ОбновитьИтогиПодобранныхТоваров(Форма)
	
	Если Форма.ПоказыватьЦены Тогда
		Форма.НадписьПодобраноТоваров = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			НСтр("ru = 'Подобрано: %1 на сумму %2'"),
			Форма.Корзина.Итог("Количество"),
			Формат(Форма.Корзина.Итог("Сумма"),"ЧДЦ=2; ЧН=0"));
	Иначе
		Форма.НадписьПодобраноТоваров = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			НСтр("ru = 'Подобрано: %1'"),
			Форма.Корзина.Итог("Количество")
			);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СоздатьСчетНаОплату(Команда)
	СоздатьДокумент("СчетНаОплатуПокупателю");
КонецПроцедуры

#КонецОбласти

#Область СозданиеДокументов

&НаСервере
Функция ПараметрыСозданияДокумента()

	ДанныеЗаполнения = Новый Структура;
	ДанныеЗаполнения.Вставить("ТипЦен", ОтборТипЦен);
	ДанныеЗаполнения.Вставить("Склад", ОтборСклад);
	ДанныеЗаполнения.Вставить("Организация", ОтборОрганизация);
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ЗначенияЗаполнения", ДанныеЗаполнения);
	ПараметрыФормы.Вставить("ПараметрыКорзины", ЗаписатьПодборВХранилище());
	ПараметрыФормы.Вставить("ТипЦен", ОтборТипЦен);
	ПараметрыФормы.Вставить("Склад", ОтборСклад);
	
	Возврат ПараметрыФормы;
	
КонецФункции

&НаСервере
// Функция помещает результаты подбора в хранилище
//
// Возвращает структуру:
//	Структура
//		- Адрес в хранилище, куда помещена выбранная номенклатура (корзина);
//		- Уникальный идентификатор формы владельца, необходим для идентификации при обработке результатов подбора;
//
Функция ЗаписатьПодборВХранилище() 
	
	ПодобранныеТовары = Корзина.Выгрузить();
	АдресКорзиныВХранилище = ПоместитьВоВременноеХранилище(ПодобранныеТовары, УникальныйИдентификатор);
	Возврат Новый Структура("АдресКорзиныВХранилище, УникальныйИдентификаторФормыВладельца", АдресКорзиныВХранилище, УникальныйИдентификатор);
	
КонецФункции // ЗаписатьПодборВХранилище()

&НаКлиенте
Процедура СоздатьДокумент(ИмяДокумента)
	
	Если ИмяДокумента = "РеализацияТоваровУслуг" Тогда
		Документ = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокументаОбщая";
	ИначеЕсли ИмяДокумента = "ПоступлениеТоваровУслуг" Тогда
		Документ = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокументаОбщая";
	Иначе
		Документ = СтрШаблон("Документ.%1.ФормаОбъекта", ИмяДокумента);
	КонецЕсли;
	ПараметрыФормы = ПараметрыСозданияДокумента();
	ОткрытьФорму(Документ, ПараметрыФормы);
	ПеренестиВДокумент = Истина;
	ЗакрытьФормуПеренестиКорзину();
	
КонецПроцедуры

&НаКлиенте
Процедура СоздатьРеализацияТоваровУслуг(Команда)
	СоздатьДокумент("РеализацияТоваровУслуг");
КонецПроцедуры

&НаКлиенте
Процедура СоздатьПоступлениеТоваровУслуг(Команда)
	СоздатьДокумент("ПоступлениеТоваровУслуг");
КонецПроцедуры

#КонецОбласти

