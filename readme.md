# Важно, при открытии карты:
Требуется редактор JNGP. При запуске карты в редакторе, в верхном меню выбрать пункт UMSWE, включить UMSWE если он выключен и поставить галочку на Custom Tile Pathability.
Открыть Customize Tile Pathability и изменить следующие тайлы:
В группе Village, выбрать 4-й тайл по верхнему ряду (Village Cobble Path) и изменить галочки так:
Buildable: true
Walkable: true
Flyable: true
В группе Lordaeron Winter, выбрать 4-й тайл по верхнему ряду (Lordaeron Winter Rock), и изменить галочки так:
Buildable: false
Walkable: false
Flyable: true
В группе Ashenvale, выбрать 4-й тайл по верхнему ряду (Ashenvale Rock), и изменить галочки так:
Buildable: false
Walkable: false
Flyable: true
В группе Northrend, выбрать 3-й тайл по верхнему ряду (Northrend Rock), и изменить галочки так:
Buildable: false
Walkable: false
Flyable: true
В группе Cityscape, выбрать 4-й тайл по центральному ряду (Cityscape Grass Trim) и изменить галочки так:
Buildable: false
Walkable: true
Flyable: true
# После выполнения пункта первого
После того, как выполните действия выше, необходимо нажать на кнопку OK и перезапустить редактор. После можно редактировать карту.
Весь код в папке code\vjass. 
# Важно
Все константы, связанные с игрой, не с конкретным триггером находятся в файле code\vjass\CothUtilities.j
Будь то айди героев, переменные содержащие их, айди предметов и всё остальное.
Вся инициализация так же проводится в этом файле. 
# Рекомендуется
После сохранения карты, когда имеется полностью готовая версия - оптимизировать её через W3XLNI, выбирая пункт SLK. Ошибку о том, что отсутствует -1 файл (к примеру 476/475 файлов) - можете её игнорировать