# Beer-CollectionViewLayout

![Пример GIF](https://private-user-images.githubusercontent.com/108129792/258399995-c330db0e-7210-48d2-9d4f-641f91b8d256.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE2OTExNDY3MTQsIm5iZiI6MTY5MTE0NjQxNCwicGF0aCI6Ii8xMDgxMjk3OTIvMjU4Mzk5OTk1LWMzMzBkYjBlLTcyMTAtNDhkMi05ZDRmLTY0MWY5MWI4ZDI1Ni5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBSVdOSllBWDRDU1ZFSDUzQSUyRjIwMjMwODA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDIzMDgwNFQxMDUzMzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1hMDNmZDk0ZDZiYjk1ZWY3MzI2NTVkODRhNTg3MDNhMDQyZDdiNTY0ZGI5OWZjZDcwYWUwMmIwOGUzMzJiZjdiJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.KIr8qBzkPxaMWyInOMR4gF-3kZ4FacLkWt3tcHKA0E0)
![Пример GIF](https://private-user-images.githubusercontent.com/108129792/258400036-0385f265-c09f-47ee-bbd0-068c4291e818.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE2OTExNDY3MTQsIm5iZiI6MTY5MTE0NjQxNCwicGF0aCI6Ii8xMDgxMjk3OTIvMjU4NDAwMDM2LTAzODVmMjY1LWMwOWYtNDdlZS1iYmQwLTA2OGM0MjkxZTgxOC5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBSVdOSllBWDRDU1ZFSDUzQSUyRjIwMjMwODA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDIzMDgwNFQxMDUzMzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT05YzcxMGU1YmYyOGQ1NTc1ZjhiMDFlZGYzY2RkMWFiMzY0MGQ5MjlhYjU5ZTlkNGFiOThjM2ZlNGJkMjY2NzE2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.pglXwPleiqECakmlHw4dPZfX1BGkCWbbG0oZpix0oeU)
![Пример GIF]([https://example.com/images/example.gif](https://private-user-images.githubusercontent.com/108129792/258400033-4a191316-54a8-4078-898c-188f3760af42.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE2OTExNDY3MTQsIm5iZiI6MTY5MTE0NjQxNCwicGF0aCI6Ii8xMDgxMjk3OTIvMjU4NDAwMDMzLTRhMTkxMzE2LTU0YTgtNDA3OC04OThjLTE4OGYzNzYwYWY0Mi5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBSVdOSllBWDRDU1ZFSDUzQSUyRjIwMjMwODA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDIzMDgwNFQxMDUzMzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jYmI3NGFiZjAxZDEzMjc2NGY1Y2E5ZGMzOWY3OTBlM2U2ZjViMDgwYjU2NWU3ODM1M2Y5ZTgxZDFhYzFkYmNjJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.quBj4WyG2i1mSSHD32-WNqbCv1OiGF8SMfR0tr58Mwc)https://private-user-images.githubusercontent.com/108129792/258400033-4a191316-54a8-4078-898c-188f3760af42.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE2OTExNDY3MTQsIm5iZiI6MTY5MTE0NjQxNCwicGF0aCI6Ii8xMDgxMjk3OTIvMjU4NDAwMDMzLTRhMTkxMzE2LTU0YTgtNDA3OC04OThjLTE4OGYzNzYwYWY0Mi5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBSVdOSllBWDRDU1ZFSDUzQSUyRjIwMjMwODA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDIzMDgwNFQxMDUzMzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jYmI3NGFiZjAxZDEzMjc2NGY1Y2E5ZGMzOWY3OTBlM2U2ZjViMDgwYjU2NWU3ODM1M2Y5ZTgxZDFhYzFkYmNjJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.quBj4WyG2i1mSSHD32-WNqbCv1OiGF8SMfR0tr58Mwc)

ТЗ тестового задания:  
● Реализовать главный экран для приложения доставки еды  
● В баннеры можно захардкодить любые фото  
● Основная задача - сделать идентичную планку с категориями и блок
меню  
● Планка с категориями при скролле должна прилипать к верхнему бару  
● При нажатии на категорию, список должен пролистываться к
соответствующему разделу. И наоборот, при пролистывании списка
должна меняться выбранная категория  
● В качестве API использовать любой открытый источник подходящий под
текущие нужды  


Я использовал:
MVP + Coordinator + AssemblyBuilder  
Realm  
Kingfisher  
BeerApi https://punkapi.com/  
Сделал фильтры по градусам, чтобы симулировать различные категории пива  

