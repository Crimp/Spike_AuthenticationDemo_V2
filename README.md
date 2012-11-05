AuthenticationDemo_V2
=====================

XAF Azure Security Demo v2

Пример демонстрирует создание сервиса используюшего протакол OData, для подключения к базе развёрнутого XAF приложения, используя Security.

Созданем вспомогательный класс DataServiceHelper. Служит для генерации TypesInfo и создания DataLayer. Также предоставляет доступ к ObjectSpaceProvider.

Класс MyContext наследуемый от XpoContext. Перекрываем метод ShowLargePropertyAsNamedStream для получения жирных свойств(например таких как картинки) сразу в запросе, а не ссылки на них.
Ксласс DataServiceBase можно опустить и веь код перекинуть в CustomWcfSecuredDataServer.



