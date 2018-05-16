# Architektura serwisów internetowych 2018

|Studenci |
|:--:
|[Błażej Kucman](https://github.com/kucmeno), [Marta Kotewicz](https://github.com/mkotewicz) |

## Projekt na egzamin 
Aplikacja CRUD pozwalająca pisać komentarze do tematów, jak również czytanie news. Została zaimplementowana Autentykacja utoryzacja użytkowników ze sztywnym podziałem na role .
User może czytać wszytko i komentować (edytować i usuwać swoje komentarze).
Moderator dodaje tematy io readguje komentarze , dodaje news i redaguje je.
Admin może wszytko.

Do obsługi połączenia obrazów z modelami zostało użyte Active Storage, a do fotmatowania zdjęć został użyty gem 'mini_magick'.
Widoki są responsywne

Po operacjach CRUD wyświetlany flash-message

## Użyte technologie/gemy
 Rails ver. 5.2.0

 Ruby: 2.5.1

 Zarządzanie użytkownikami i rolami

 gem 'cancancan', '~> 2.2'

 gem 'devise'

 gem 'rolify'

 Paginacja

 gem 'kaminari'

 Fejkowe dane
 
 gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

fotmatowanie zdjęć - :gem: gem 'mini_magick'

[DOCKERHUB] https://hub.docker.com/r/kucmeno/writeposts_web/

[Instrukcja] Instrukcje uruchomienia są zapisane w step.txt
