## Практическая работа 5

Хромых В.А ЭФБО-06-23

## Цели ПЗ
	•	Освоить процесс создания простого Flutter-приложения «Заметки».
	•	Научиться работать с виджетами состояния (StatefulWidget, setState).
	•	Отработать навыки работы со списками (ListView.builder) и их элементами.
	•	Научиться использовать навигацию (Navigator.push/pop) для перехода между экранами и передачи данных.
	•	Реализовать CRUD-операции (создание, чтение, обновление, удаление) на примере заметок.
	•	Закрепить работу с формами (Form, TextFormField) и валидацией.
  </br> </br> </br>
## Ход работы
Создан проект: flutter create simple_notes
Добавлена модель Note с методом copyWith.</br>
<img width="574" height="293" alt="Screenshot 2025-10-02 at 15 06 34" src="https://github.com/user-attachments/assets/a02151b0-eb6d-46e4-9929-01860ea270d1" />




Реализован экран списка заметок с ListView.builder.</br>
<img width="749" height="529" alt="image" src="https://github.com/user-attachments/assets/1fdbf719-95a1-4947-b906-6ecb184a5307" />

Добавлены кнопки: + для добавления, корзина и свайп для удаления.
Сделан экран редактирования с формой (Form, TextFormField).</br>
<img width="692" height="622" alt="Screenshot 2025-10-02 at 15 07 39" src="https://github.com/user-attachments/assets/406223e2-e10c-4119-a2e4-35ecf9d0b57c" />

Добавлен поиск по заголовку.
</br>
<img width="684" height="217" alt="Screenshot 2025-10-02 at 15 08 12" src="https://github.com/user-attachments/assets/c5145dc1-73d8-48f3-897b-982ecef39371" />

Сделан современный дизайн: карточки заметок, градиент, расширенная кнопка, свайп-удаление. </br> </br> </br>



https://github.com/user-attachments/assets/441aa2e8-74b4-4580-a50c-479068ece628


</br></br></br>


## Контрольные вопросы
 Зачем использовать ListView.builder? </br> Для ленивой подгрузки элементов и экономии памяти. </br>
 Как передать объект на новый экран и вернуть его обратно? </br> Navigator.push + Navigator.pop(context, объект). </br>
 Зачем нужны Key в списках?</br> Чтобы Flutter мог корректно различать элементы при перестроении. </br>
 Самый простой способ удалить элемент?</br> setState(() => _notes.remove(note)) или Dismissible. </br>
Что будет, если не вызвать setState после редактирования? </br> UI не обновится, изменения не отобразятся. </br>
 Как быстро сгенерировать уникальный id? </br> DateTime.now().millisecondsSinceEpoch.toString().  </br> </br> </br>
✅ Выводы
Реализовано полноценное приложение «Заметки» с современным дизайном. Освоена работа со списками, состоянием и навигацией во Flutter. Наиболее интересным оказалось оформление интерфейса (градиенты, карточки, анимации).
