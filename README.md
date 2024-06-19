<h1 align="center">CPD-Projekt SS2024</h1>
<div align=center>Sven Hoffmann - 2011141</div>
<h4 align="center">
    Diese App vereint nützliche Funktionen, die einem dabei helfen sollen, gute Gewohnheiten aufzubauen.
    <br>
    Primär entwickelt für Android und Webbrowser (Chrome) unter Verwendung von <a href="https://flutter.dev/">Flutter</a>.
</h4>

<p align="center">
  <a href="#funktionen">Funktionen</a> •
  <a href="#tools-und-quellen">Tools und Quellen</a>
</p>


## Funktionen

### Main Page

#### Home
Diese zentrale Seite der App bietet einen Überblick über alle vorhandenen Funktionen.
- Meditation-Timer
- Pomodoro-Timer
- Exercise-Reminder
- Review


<br>
Wurde eine Funktion genutzt, wird dem Nutzer dies erkenntlich gemacht, indem ein Haken beim entsprechenden Symbol der Funktion zum Beispiel bei der Streak-Übersicht gesetzt wird.
Für das tägliche Nutzen der genannten Funktionen erhöht sich deren Streak (Lauf), was man der Streak-Übersicht entnehmen kann. Sollte eine Funktion einen Tag lang nicht genutzt worden sein, wird deren Streak bei der nächsten Nutzung der App wieder auf 0 gesetzt.
<br>

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
  <img src="readme_images/mobile/home/home_1.png" alt="home page" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/home/home_streak.png" alt="home page with streaks" style="width:20%; max-width:400px">
</div>
<br>

<details>
<summary><span style="font-weight: bold">Webbrowser (Chrome) - Home</span></summary>
<br>
<div align="center">
  <img src="readme_images/chrome/chrome_home.png" alt="home page chrome" style="width:80%;">
</div>
<br>
</details>

#### History

Über die untere Navigationsleiste kann man neben der Homepage auf die History (Verlauf) zugreifen und sich dort eine Übersicht über die letzten sieben Nutzungsaktivitäten der App anschauen. Zu den einzelnen Aktivitäten wird jeweils aufgelistet, von wann die Aktivität ist, welche Funktionen genutzt wurden und das Review an dem Tag, sprich die eingeschätzte Stimmung, mit oder ohne eine zusätzliche Notiz.

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
  <img src="readme_images/mobile/history/history_1.png" alt="history page with one activity" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/history/history_2.png" alt="history page with four activities" style="width:20%; max-width:400px">
</div>
<br>

<details>
<summary><span style="font-weight: bold">Webbrowser (Chrome) - History</span></summary>
<br>
<div align="center">
  <img src="readme_images/chrome/chrome_history.png" alt="history page chrome" style="width:80%;">
</div>
<br>
</details>


### Meditation-Timer
* Manchmal tut es einfach gut, die kreisenden Gedanken zur Ruhe zu bringen. Meditation ist mittlerweile ein gängiges Mittel, um einen Ausgleich im stressigen Alltag zu schaffen. Dieser Meditation-Timer bietet dir jeden Tag die Möglichkeit, für eine kurze Zeit abzuschalten. Nutze daher jeden Tag die Chance, deinen Geist wieder mit deinem Körper in Einklang zu bringen. Der Meditation-Timer endet immer mit einem angenehmen "Gong"-Klang.

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
  <img src="readme_images/mobile/meditation/meditation_1.png" alt="random exercise time choice" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/meditation/meditation_2.png" alt="random exercise cycle choice" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/meditation/meditation_3.png" alt="exercise page everything set" style="width:20%; max-width:400px">
</div>
<br>

<details>
<summary><span style="font-weight: bold">GIF - Meditation-Timer</span></summary>

<br>
<div style="text-align: center; justify-content: center;">
      <p>Ende Meditation-Timer</p>
      <img src="readme_images/mobile/meditation/meditation_timer_end.gif" alt="meditation timer end" style="width:20%; max-width:400px">
    </div>
<br>
</details>

<details>
<summary><span style="font-weight: bold">Webbrowser (Chrome) - Meditation-Timer</span></summary>
<br>
<div align="center">
  <img src="readme_images/chrome/chrome_meditation_1.png" alt="meditation timer chrome" style="width:80%;">
  <br>
  <br>
  <br>
  <img src="readme_images/chrome/chrome_meditation_2.png" alt="meditation timer chrome set" style="width:80%;">
</div>
<br>
</details>

### Pomodoro-Timer
* Schonmal von der Pomodoro-Technik gehört? Die Pomodoro-Technik ist beliebt unter Leuten, die gerne fokussiert arbeiten. Man arbeitet dabei in festen Zeitabschnitten, die meist zwischen 25 - 90 Minuten lang sind. Nach diesen Zeitabschnitten folgt immer eine Pause, um dem Kopf ein wenig Zeit zum Durchatmen zu geben. Das ist ein guter Ansatz, um Burnout vorzubeugen. Der Pomodoro-Timer hier hilft dir dabei, dich nur auf deine Arbeit zu konzentrieren. Stelle einfach deine bevorzugte Dauer für einen Arbeitsabschnitt ein. Ist es Zeit für eine Pause, gibt dir der Pomodoro-Timer Bescheid in Form eines Signaltons.

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
  <img src="readme_images/mobile/pomodoro/pomodoro_1.png" alt="pomodoro timer" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/pomodoro/pomodoro_2.png" alt="pomodoro timer time choice" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/pomodoro/pomodoro_3.png" alt="pomodoro timer time set" style="width:20%; max-width:400px">
</div>
<br>

<details>
<summary><span style="font-weight: bold">GIF - Pomodoro-Timer</span></summary>

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
<div style="display: flex; justify-content: center; gap: 20px; align-items: center; flex-direction: column;">
  <div style="display: flex; gap: 20px;">
    <div style="text-align: center;">
      <p>Ende Arbeitsphase</p>
      <img src="readme_images/mobile/pomodoro/pomodoro_work_end.gif" alt="pomodoro timer work phase end" style="width:80%; max-width:400px">
    </div>
    <div style="text-align: center;">
      <p>Ende Pause</p>
      <img src="readme_images/mobile/pomodoro/pomodoro_break_end.gif" alt="pomodoro timer break phase end" style="width:80%; max-width:400px">
    </div>
  </div>
</div>
</div>
<br>
</details>

<details>
<summary><span style="font-weight: bold">Webbrowser (Chrome) - Pomodoro-Timer</span></summary>
<br>
<div align="center">
  <img src="readme_images/chrome/chrome_pomodoro_1.png" alt="pomodoro timer chrome" style="width:80%;">
  <br>
  <br>
  <br>
  <img src="readme_images/chrome/chrome_pomodoro_2.png" alt="pomodoro timer chrome set" style="width:80%;">
</div>
<br>
</details>

### Exercise-Reminder

#### Auflisten von Tätigkeiten
* Lass dich daran erinnern, kleine sportliche Übungen durchzuführen oder einfach nur zwischendurch mal aufzustehen und etwas zu trinken. Damit verhinderst du aufkommende Trägheit und bleibst tagsüber körperlich und geistig fit. Du kannst dafür alle möglichen Tätigkeiten einer Liste hinzufügen.

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
  <img src="readme_images/mobile/exercise/exercise_1.png" alt="exercise page" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/exercise/exercise_2.png" alt="exercise list" style="width:20%; max-width:400px">
</div>
<br>

#### Aktiver durch Erinnerung
* Der Random Exercise Timer erinnert dich dabei an eine zufällige Tätigkeit aus deiner zuvor erstellten Liste. Sei also bereit spontan mal ein paar Liegestütze machen. Du entscheidest selbst wann und wie oft du erinnert werden möchtest. Nach Ablauf des Timers ertönt ein Signalton.

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
  <img src="readme_images/mobile/exercise/exercise_3.png" alt="random exercise time choice" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/exercise/exercise_4.png" alt="random exercise cycle choice" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/exercise/exercise_5.png" alt="exercise page everything set" style="width:20%; max-width:400px">
</div>
<br>
<br>
<br>

<div align="center">
    <img src="readme_images/mobile/exercise/random_exercise.gif" alt="Exercise reminder" style="width:35%; max-width:600px">
</div>
<br>

<details>
<summary><span style="font-weight: bold">Webbrowser (Chrome) - Exercise</span></summary>
<br>
<div align="center">
  <img src="readme_images/chrome/chrome_exercise_1.png" alt="exercise page chrome" style="width:80%;">
  <br>
  <br>
  <br>
  <img src="readme_images/chrome/chrome_exercise_2.png" alt="exercise page chrome set" style="width:80%;">
</div>
<br>
</details>

### Review
* Wie war eigentlich dein Tag? Viel zu selten hält man inne und reflektiert, wie es einem denn so geht. Oder die Tage gehen vorüber und man kann sich nicht mehr daran erinnern, was man diese Woche alles unternommen hat. Die Review-Funktion soll einem eine Möglichkeit bieten, kurz festzuhalten, wie man sich nach einem Tag fühlt. Man kann über eine Emoji-Skala einordnen, wie die Stimmung von einem ist und hat die Möglichkeit, eine kurze Notiz zu verfassen, um zum Beispiel ein besonderes Event des Tages hervorzuheben. Das Ganze dient als eine Art kleiner Tagebucheintrag, der als Gedächtnisstütze fungieren kann, aber auch um sich vor Augen zu führen, was einen womöglich momentan (emotional) beschäftigt.

<br>
<div style="display: flex; justify-content: center; gap: 40px;">
  <img src="readme_images/mobile/review/review_1.png" alt="pomodoro timer" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/review/review_2.png" alt="pomodoro timer time choice" style="width:20%; max-width:400px">
  <img src="readme_images/mobile/review/review_3.png" alt="pomodoro timer time set" style="width:20%; max-width:400px">
</div>
<br>

<details>
<summary><span style="font-weight: bold">Webbrowser (Chrome) - Review</span></summary>
<br>
<div align="center">
  <img src="readme_images/chrome/chrome_review_1.png" alt="review page chrome" style="width:80%;">
  <br>
  <br>
  <br>
  <img src="readme_images/chrome/chrome_review_2.png" alt="review page chrome set" style="width:80%;">
</div>
<br>
</details>


## Tools und Quellen

* Flutter mit [Android Studio](https://developer.android.com/studio?hl=de)
* NoSQL Datenbank [Hive](https://pub.dev/packages/hive)
* Icons von [Icons8](https://icons8.de/)
* Sounds von [Pixabay](https://pixabay.com/de/sound-effects/) (Pixabay, floraphonic)