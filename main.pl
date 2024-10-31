% Оголошення фактів 
:- discontiguous is_a/2.
:- discontiguous part_of/2.
:- discontiguous causes/2.
:- discontiguous has_property/2.

% Факти про страви
dish(яєшня, сніданок, солоне, 15).
dish(яєшня_з_помідорами, сніданок, солоне, 15).
dish(яйця_по_іспанськи, сніданок, солодке, 30).
dish(яблучний_пиріг, вечеря, солодке, 60).
dish(яловичий_бургер, вечеря, солоне, 60).
dish(яблучний_кекс, сніданок, солодке, 45).
dish(яблучний_мус, десерт, солодке, 45).
dish(яблучна_запіканка, вечеря, солодке, 60).
dish(якіті_карі, вечеря, гостре, 30).
dish(японська_каша, сніданок, солодке, 20).
dish(ячмінний_суп, обід, солоне, 45).
dish(яблучний_торт, десерт, солодке, 60).
dish(яловичий_стейк, вечеря, солоне, 40).
dish(яблучний_джем, сніданок, солодке, 30).
dish(овочевий_суп, обід, солоне, 30).
dish(курячий_бургери, вечеря, солоне, 45).
dish(салат_цезар, обід, солоне, 20).
dish(паста_альфредо, вечеря, солодке, 50).
dish(фруктовий_салат, десерт, солодке, 20).
dish(млинці, сніданок, солодке, 15).
dish(шоколадний_торт, десерт, солодке, 70).
dish(плов, вечеря, солоне, 60).
dish(суп_пюре, обід, солоне, 40).
dish(пиріжки, сніданок, солодке, 30).
dish(омлет, сніданок, солоне, 20).
dish(тости, сніданок, солоне, 10).
dish(гречка, обід, солоне, 30).
dish(рибний_суп, обід, солоне, 40).
dish(фрикадельки, вечеря, солоне, 50).
dish(пиріг_з_вишнями, десерт, солодке, 45).
dish(чізкейк, десерт, солодке, 60).

% Правила для ідентифікації блюд
satisfies_criteria(Dish, Type, Taste, CookingTime) :-
    dish(Dish, Type, Taste, CookingTime).

% Нові зв’язки
causes(сніданок, енергія).            % третій тип зв’язку
causes(вечеря, ситість).
has_property(яєшня, популярна).       % четвертий тип зв’язку
has_property(яблучний_пиріг, солодке).
has_property(яловичий_стейк, поживний).

% Виведення впливу зв’язків
check_impact_on_dish(Dish) :-
    dish(Dish, Type, _, _),
    causes(Type, Effect),
    write("Страва "), write(Dish), write(" викликає "), write(Effect), nl,
    (has_property(Dish, Property) ->
        write("Властивість "), write(Dish), write(": "), write(Property), nl; 
        write("Немає специфічної властивості для "), write(Dish), nl).

% Процедура для виведення всіх страв
list_all_dishes :-
    write("Список усіх страв:"), nl,
    findall(Dish, dish(Dish, сніданок, _, _), BreakfastDishes),
    findall(Dish, dish(Dish, обід, _, _), LunchDishes),
    findall(Dish, dish(Dish, вечеря, _, _), DinnerDishes),
    write("Сніданок: "), write(BreakfastDishes), nl,
    write("Обід: "), write(LunchDishes), nl,
    write("Вечеря: "), write(DinnerDishes), nl.

% Оновлена модель виведення з новими типами зв’язків
ask_user :- 
    repeat,
    write("Чи хочете ви отримати список страв? (так/ні): "), read(Answer),
    (Answer = так -> list_all_dishes;
    (Answer = ні -> write("Дякуємо за використання програми!"), nl, ! ; write("Невірний ввод, спробуйте ще раз."), nl)),
    write("Чи хочете ви побачити вплив нових типів зв’язків на страви? (так/ні): "), read(ImpactAnswer),
    (ImpactAnswer = так -> 
        write("Введіть назву страви для перевірки: "), read(Dish), check_impact_on_dish(Dish); 
        true).

% Запуск програми
:- initialization(ask_user).
