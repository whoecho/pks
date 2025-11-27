

Отчет по практической работе №12

Хромых В.А ЭФБО-06-23
<br>
Скриншот главного экрана при запуске:<br>
<br>
<img width="680" height="1394" alt="image" src="https://github.com/user-attachments/assets/198992f2-1ffa-45c0-bc5c-78eadf984864" />
<br>
Скриншот создания фото:<br>
<img width="636" height="1378" alt="image" src="https://github.com/user-attachments/assets/8e04e801-5380-4542-9ea0-f7af0034d9fc" />
<br>
Скриншот после сделанного фото:<br>
<img width="680" height="1394" alt="image" src="https://github.com/user-attachments/assets/c64f0db5-d13f-4548-a65d-ce522b068a66" />

Краткое описание шагов реализации

1)Создание проекта - инициализация Flutter-приложения camera_app

2)Установка зависимостей - добавление в pubspec.yaml пакетов:

image_picker - для работы с камерой и галереей

permission_handler - для управления разрешениями

path_provider - для работы с файловой системой


3)Настройка разрешений - добавление в AndroidManifest.xml и Info.plist соответствующих прав доступа к камере и хранилищу

Реализация логики приложения:

1)Создание интерфейса с кнопками управления

2)Реализация методов для съемки фото и выбора из галереи

3)Добавление функции сохранения изображений в локальное хранилище

<br>
Основной фрагмент кода:
<br>
<img width="641" height="613" alt="Screenshot 2025-11-27 at 17 23 43" src="https://github.com/user-attachments/assets/4534f30e-024e-4409-b469-35486a6d513c" />

