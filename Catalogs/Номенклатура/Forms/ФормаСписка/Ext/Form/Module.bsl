﻿#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПИН_ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// Определим настройку учета по складам и по подразделениям.
	СчетТоварыНаСкладах = ПланыСчетов.Хозрасчетный.ТоварыНаСкладах;
	ВедетсяУчетПоСкладам = БухгалтерскийУчет.ВедетсяУчетПоСкладам(СчетТоварыНаСкладах);
	ОтборОрганизация = Справочники.Организации.ОрганизацияПоУмолчанию();
	ОтборСклад = Справочники.Склады.ПолучитьСкладПоУмолчанию();
	Если НЕ ПолучитьФункциональнуюОпцию("ИспользоватьТипыЦенНоменклатуры") Тогда
		ПоказыватьЦены = Ложь;
		ОтборТипЦен = Неопределено;
	КонецЕсли;
	УправлениеСписком();
	УправлениеФормой(ЭтаФорма);
	
КонецПроцедуры

&НаСервере
Процедура ПИН_ПриЗагрузкеДанныхИзНастроекНаСервере(Настройки)
	
	Если НЕ ЗначениеЗаполнено(ОтборСклад) Тогда
		ОтборСклад = Справочники.Склады.ПолучитьСкладПоУмолчанию();
	КонецЕсли;
	СвернутьРазвернутьПанель(СвернутьПанель);
	УправлениеСписком();
	УправлениеФормой(ЭтаФорма);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ПИН_ДекорацияРазвернутьНажатие(Элемент)
	
	СвернутьПанель = НЕ СвернутьПанель;
	СвернутьРазвернутьПанель(СвернутьПанель);
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ПоказыватьОстаткиПриИзменении(Элемент)
	
	УправлениеСписком();

КонецПроцедуры

&НаКлиенте
Процедура ПИН_ОтборТипЦенПриИзменении(Элемент)
	
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ПоказыватьЦеныПриИзменении(Элемент)
	
	Если НЕ ПоказыватьЦены Тогда
		ЦенаОт = 0;
		ЦенаДо = 0;
		ОтборТипЦен = Неопределено;
	КонецЕсли;
	
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ОтборСкладПриИзменении(Элемент)
	УправлениеСписком();
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ОтборСкладОчистка(Элемент, СтандартнаяОбработка)
	УправлениеСписком();
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ОтборОстаткиПриИзменении(Элемент)
	
	УстановитьЗначениеПараметраПоказыватьТолькоОстаткиСпискаНоменклатуры(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ЦеныОтПриИзменении(Элемент)
	
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ЦеныДоПриИзменении(Элемент)
	
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ОтборТипЦенОчистка(Элемент, СтандартнаяОбработка)
	
	УправлениеСписком();
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ДекорацияСвернутьНажатие(Элемент)
	
	СвернутьПанель = НЕ СвернутьПанель;
	СвернутьРазвернутьПанель(СвернутьПанель);
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ДекорацияКорзинаНажатие(Элемент)
	
	ОткрытьКорзину();
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ДекорацияКорзинаПроверкаПеретаскивания(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ДекорацияКорзинаПеретаскивание(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ДобавитьВКорзину(ПараметрыПеретаскивания.Значение);
	
	УправлениеФормой(ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_НадписьПодобраноТоваровНажатие(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	ОткрытьКорзину();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийТаблицыФормыИерархияНоменклатуры

&НаКлиенте
Процедура ПИН_ИерархияНоменклатурыПриАктивизацииСтроки(Элемент)
	
	УстановитьОтборПоИерархииНоменклатуры(Элементы.ИерархияНоменклатуры.ТекущаяСтрока);
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ИерархияНоменклатурыВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	УстановитьОтборПоИерархииНоменклатуры(ВыбраннаяСтрока);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПИН_ДобавитьВКорзинуИзСписка(Команда)
	ДобавитьВКорзину(Элементы.Список.ТекущаяСтрока);
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ДокументСчетНаОплатуСоздатьИзКорзины(Команда)
	
	СоздатьДокумент("СчетНаОплатуПокупателю");
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ДокументРеализацияТоваровУслугСоздатьИзКорзины(Команда)
	СоздатьДокумент("РеализацияТоваровУслуг");
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ДокументПоступлениеТоваровУслугСоздатьИзКорзины(Команда)
	СоздатьДокумент("ПоступлениеТоваровУслуг");
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Корзина

&НаКлиенте
Процедура ОткрытьКорзину()
	
	Если Корзина.Количество()>0 Тогда
		ПараметрыКорзины = ЗаписатьПодборВХранилище();
		ОткрытьКорзинуПродолжить(ПараметрыКорзины);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьКорзинуПродолжить(ПараметрыКорзины)
	
	ПередаваемыеПараметры = Новый Структура;
	ПередаваемыеПараметры.Вставить("АдресКорзиныВХранилище", ?(ЗначениеЗаполнено(ПараметрыКорзины), ПараметрыКорзины.АдресКорзиныВХранилище, Неопределено));
	ПередаваемыеПараметры.Вставить("ОтборТипЦен", ОтборТипЦен);
	ПередаваемыеПараметры.Вставить("ОтборСклад", ОтборСклад);
	ПередаваемыеПараметры.Вставить("ОтборОрганизация", ОтборОрганизация);
	ПередаваемыеПараметры.Вставить("ПоказыватьЦены", ПоказыватьЦены);
	
	ПередаваемыеПараметры.Вставить("УникальныйИдентификаторФормыВладельца", УникальныйИдентификатор);
	ОповещениеКорзинаЗакрытие = Новый ОписаниеОповещения("КорзинаЗакрытие",ЭтотОбъект);
	ОткрытьФорму("Обработка.ПанельИнформацииНоменклатуры.Форма.ФормаКорзина",ПередаваемыеПараметры, ЭтаФорма,,,,ОповещениеКорзинаЗакрытие,
		РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры

&НаКлиенте
Процедура КорзинаЗакрытие(ПараметрЗакрытия, Параметры) Экспорт

	Корзина.Очистить();
	
	Если ПараметрЗакрытия = Неопределено Тогда
		//Закрытие без сохранения
	ИначеЕсли ПараметрЗакрытия="ПеренестиВДокумент" Тогда
		//Закрытие без сохранения
	Иначе 
		//Закрытие с сохранением
		Для каждого стр Из ПараметрЗакрытия.Корзина Цикл
			НовСтр = Корзина.Добавить();
			ЗаполнитьЗначенияСвойств(НовСтр, стр);
		КонецЦикла;
	КонецЕсли;
	
	УправлениеФормой(ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьВКорзину(ВыбранныеСтроки)
	
	Если ТипЗнч(ВыбранныеСтроки) = Тип("Массив") Тогда
		Для каждого ВыделеннаяСтрока Из ВыбранныеСтроки Цикл
			ДобавитьСтрокуВКорзину(ВыделеннаяСтрока);
		КонецЦикла; 
	ИначеЕсли ТипЗнч(ВыбранныеСтроки) = Тип("СправочникСсылка.Номенклатура") Тогда
		ДобавитьСтрокуВКорзину(ВыбранныеСтроки);
	КонецЕсли;
	
	УправлениеФормой(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьСтрокуВКорзину(ВыделеннаяСтрока)

	ДанныеСтроки = Элементы.Список.ДанныеСтроки(ВыделеннаяСтрока);
	
	СтруктураВыбора = СтруктураВыбора();
	ЗаполнитьЗначенияСвойств(СтруктураВыбора, ДанныеСтроки);
	СтруктураВыбора.Номенклатура = ДанныеСтроки.Ссылка;
	СтруктураВыбора.Количество = 1;
	ДобавитьНоменклатуруВКорзину(СтруктураВыбора);
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьНоменклатуруВКорзину(СтруктураВыбора)
	
	СтруктураПоискаВКорзине = Новый Структура;
	СтруктураПоискаВКорзине.Вставить("Номенклатура", СтруктураВыбора.Номенклатура);
	НайденныеСтроки = Корзина.НайтиСтроки(СтруктураПоискаВКорзине);
	Если НайденныеСтроки.Количество()=0 Тогда
		СтрокаКорзины = Корзина.Добавить();
		ЗаполнитьЗначенияСвойств(СтрокаКорзины, СтруктураВыбора);
	Иначе
		СтрокаКорзины = НайденныеСтроки[0];
		СтрокаКорзины.Количество = СтрокаКорзины.Количество + СтруктураВыбора.Количество;
		//Если цена изменилась - перезаполняем новым значением
		СтрокаКорзины.Цена = СтруктураВыбора.Цена;
	КонецЕсли;
	
	ОбработкаТабличныхЧастейКлиентСервер.РассчитатьСуммуТабЧасти(СтрокаКорзины);
	ОбработкаТабличныхЧастейКлиентСервер.РассчитатьСуммуНДСТабЧасти(СтрокаКорзины);
	
	ПоказатьОповещениеПользователя(НСтр("ru = 'Подбор товаров'")
		,
		,
		НСтр("ru = 'Товар "+СтруктураВыбора.Номенклатура+" добавлен в корзину'"));
		
	
КонецПроцедуры

&НаКлиенте
Функция СтруктураВыбора()
	
	Возврат 
		Новый Структура(
		"Номенклатура,
		|ЕдиницаИзмерения,
		|Цена,
		|СтавкаНДС,
		|Количество,
		|Услуга");
		
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
	Корзина.Очистить();
	УправлениеФормой(ЭтаФорма);
	ОписаниеОповещения = Новый ОписаниеОповещения("СоздатьДокументЗавершение", ЭтотОбъект);
	ОткрытьФорму(Документ, ПараметрыФормы,,,,,ОписаниеОповещения);

КонецПроцедуры

#КонецОбласти

#Область Форма

&НаСервере
Процедура СвернутьРазвернутьПанель(СвернутьПанель)
	
	Если СвернутьПанель Тогда
		Элементы.ПанельИнформации.Видимость = Ложь;
		Элементы.ГруппаЗаглушка.Видимость   = Истина;
	Иначе
		Элементы.ПанельИнформации.Видимость = Истина;
		Элементы.ГруппаЗаглушка.Видимость   = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УправлениеФормой(Форма)
	
	Элементы = Форма.Элементы;
	Элементы.Цена.Видимость = Форма.ПоказыватьЦены;
	Элементы.Валюта.Видимость = Форма.ПоказыватьЦены;
	Элементы.ЦеныОт.Доступность = Форма.ПоказыватьЦены;
	Элементы.ЦеныДо.Доступность = Форма.ПоказыватьЦены;
	Элементы.ОтборТипЦен.Доступность = Форма.ПоказыватьЦены;
	
	Элементы.КоличествоОстаток.Видимость = Форма.ПоказыватьОстатки;
	Элементы.ДекорацияКорзинаПустая.Видимость = (Форма.Корзина.Количество() = 0);
	Элементы.ДекорацияКорзина.Видимость = НЕ (Форма.Корзина.Количество() = 0);
	
	ОбновитьНадписьПодобраноТоваров(Форма);
	
КонецПроцедуры

//Обновляет итоги подобранных товаров в форме Корзина справочника Номенклатура
&НаКлиентеНаСервереБезКонтекста
Процедура ОбновитьНадписьПодобраноТоваров(Форма)
	
	КоличествоТоваров = Форма.Корзина.Итог("Количество");
	СуммаТоваров      = Форма.Корзина.Итог("Сумма");
	
	Если Форма.Корзина.Количество()=0 Тогда
		Форма.НадписьПодобраноТоваров = НСтр("ru = 'перетащите товары в корзину'");
	ИначеЕсли Форма.ПоказыватьЦены Тогда
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

&НаКлиенте
Процедура СоздатьДокументЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
	Элементы.Список.Обновить();
	
КонецПроцедуры

#КонецОбласти

#Область Отборы

&НаСервере
Процедура УправлениеСписком()
	
	ВидыСубконто = Новый Массив;
	ВидыСубконто.Добавить(ПланыВидовХарактеристик.ВидыСубконтоХозрасчетные.Номенклатура);
	СписокСчетов = Новый Массив;
	СписокСчетов = ПолучитьСписокСчетов(СписокСчетов, ВидыСубконто);
	Если ВедетсяУчетПоСкладам Тогда
		ВидыСубконто.Добавить(ПланыВидовХарактеристик.ВидыСубконтоХозрасчетные.Склады);
		ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(Список, "Субконто"+ВидыСубконто.Количество(),
			ОтборСклад, ЗначениеЗаполнено(ОтборСклад));
	КонецЕсли;
	
	Если ЗначениеЗаполнено(ОтборОрганизация) Тогда
		СписокОрганизаций = ОбщегоНазначенияКлиентСервер.ЗначениеВМассиве(ОтборОрганизация);
	Иначе
		СписокОрганизаций = ОбщегоНазначенияБПВызовСервераПовтИсп.ВсеОрганизацииДанныеКоторыхДоступныПоRLS(Ложь);
	КонецЕсли;
	ОтборПоказыватьЦены = (ПоказыватьЦены И ЗначениеЗаполнено(ОтборТипЦен));
	Список.Параметры.УстановитьЗначениеПараметра("ДатаОстаткиЦены",   КонецДня(ОбщегоНазначения.ТекущаяДатаПользователя()));
	Список.Параметры.УстановитьЗначениеПараметра("ПоказыватьЦены",    ОтборПоказыватьЦены);
	Список.Параметры.УстановитьЗначениеПараметра("ВидыСубконто",      ВидыСубконто);
	Список.Параметры.УстановитьЗначениеПараметра("СписокСчетов",      СписокСчетов);
	Список.Параметры.УстановитьЗначениеПараметра("СписокОрганизаций", СписокОрганизаций);
	
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(
		Список, 
		"Цена", 
		ЦенаОт, 
		(ЦенаОт <> 0) И ОтборПоказыватьЦены, 
		ВидСравненияКомпоновкиДанных.БольшеИлиРавно);
	
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(
		Список,
		"Цена2",
		ЦенаДо,
		(ЦенаДо <> 0) И ОтборПоказыватьЦены,
		ВидСравненияКомпоновкиДанных.МеньшеИлиРавно);
		
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(Список, "ТипЦен",
		ОтборТипЦен, ЗначениеЗаполнено(ОтборТипЦен));
	
	УстановитьЗначениеПараметраПоказыватьТолькоОстаткиСпискаНоменклатуры(ЭтаФорма);
	
	УправлениеФормой(ЭтотОбъект);
	
	Элементы.Список.Обновить();
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьСписокСчетов(Знач СписокСчетов, Знач СписокСубконто)

	Запрос = Новый Запрос;
	
	Исключения = Новый Массив;
	Исключения.Добавить(ПланыСчетов.Хозрасчетный.ГТД);
	Исключения.Добавить(ПланыСчетов.Хозрасчетный.МатериальныеЦенностиВЭксплуатации);
	
	Запрос.УстановитьПараметр("СписокСубконто", СписокСубконто);
	Запрос.УстановитьПараметр("Исключения", Исключения);
	Если СписокСчетов.Количество() <> 0 Тогда
	
		Запрос.УстановитьПараметр("СписокСчетов", СписокСчетов);
	
	КонецЕсли;
	
	Запрос.Текст = 
	"ВЫБРАТЬ РАЗЛИЧНЫЕ
	|	ХозрасчетныйВидыСубконто.Ссылка
	|ИЗ
	|	ПланСчетов.Хозрасчетный.ВидыСубконто КАК ХозрасчетныйВидыСубконто
	|ГДЕ
	|	ХозрасчетныйВидыСубконто.ВидСубконто В(&СписокСубконто)
	|	И НЕ ХозрасчетныйВидыСубконто.Ссылка В (&Исключения)
	|	И НЕ ХозрасчетныйВидыСубконто.Ссылка.ЗапретитьИспользоватьВПроводках И НЕ ХозрасчетныйВидыСубконто.Ссылка.Забалансовый"
	+?(СписокСчетов.Количество() = 0, "", " И ХозрасчетныйВидыСубконто.Ссылка В ИЕРАРХИИ (&СписокСчетов)");
	
	Возврат Запрос.Выполнить().Выгрузить().ВыгрузитьКолонку("Ссылка");
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьЗначениеПараметраПоказыватьТолькоОстаткиСпискаНоменклатуры(Форма)

	ИспользованиеОтбора = (Форма.ОтборОстатки <> 0);
	ИспВидСравнения = ?(Форма.ОтборОстатки = 1, ВидСравненияКомпоновкиДанных.Больше, ВидСравненияКомпоновкиДанных.МеньшеИлиРавно);
	
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(
		Форма.Список, 
		"КоличествоОстаток", 
		0, 
		ИспользованиеОтбора, 
		ИспВидСравнения);
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьОтборПоИерархииНоменклатуры(ГруппаНоменклатуры)
	
	ОтборыСписковКлиентСервер.ИзменитьЭлементОтбораСписка(Список, "Ссылка",
		ГруппаНоменклатуры, ЗначениеЗаполнено(ГруппаНоменклатуры), ВидСравненияКомпоновкиДанных.ВИерархии);
	
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ОтборОрганизацияПриИзменении(Элемент)
	УправлениеСписком();
КонецПроцедуры

&НаКлиенте
Процедура ПИН_ОтборОрганизацияОчистка(Элемент, СтандартнаяОбработка)
	УправлениеСписком();
КонецПроцедуры

#КонецОбласти

#КонецОбласти