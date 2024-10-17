
name('taras_shevchenko_uni').
breif_description('Taras Shevchenko University is a public university in Ukraine, based in Kyiv. It is one of the top universities in Ukraine. There are 34 departments, 4 institutes under six faculties.').
location('Taras Shevchenko University stands in the center of Kyiv, Ukraine.').
established('taras_shevchenko_uni', '1839').
first_vice_chancellor('Mykhailo Drahomanov').
current_vice_chancellor('Professor Doctor Serhiy Kvit').
history('The university was established in 1839 and is named after the prominent Ukrainian poet Taras Shevchenko. It has grown significantly since its inception and has become a leading educational institution in Ukraine.').
area('150 acres which is approximately 0.61 square kilometers').
number_of_faculties('6').
number_of_departments('34').
number_of_institutes('4').
faculty('Faculty of Mathematics and Computer Science').
faculty('Faculty of Biology').
faculty('Faculty of Social Sciences').
faculty('Faculty of Humanities').
faculty('Faculty of Economics').
faculty('Faculty of Law').
faculties('Faculty of Mathematics and Computer Science, Faculty of Biology, Faculty of Social Sciences, Faculty of Humanities, Faculty of Economics, Faculty of Law').
departments('Department of Computer Science, Department of Mathematics, Department of Physics, Department of Biology, Department of Chemistry, Department of Statistics, Department of Philosophy, Department of Economics, Department of Law, Department of History, Department of Sociology, Department of Psychology, Department of International Relations, Department of Geography, Department of Philology, Department of Fine Arts, Department of Journalism').
departments_under_faculty('Faculty of Mathematics and Computer Science', 'Department of Computer Science').
departments_under_faculty('Faculty of Mathematics and Computer Science', 'Department of Mathematics').
departments_under_faculty('Faculty of Mathematics and Computer Science', 'Department of Statistics').
departments_under_faculty('Faculty of Biology', 'Department of Biology').
departments_under_faculty('Faculty of Biology', 'Department of Chemistry').
departments_under_faculty('Faculty of Social Sciences', 'Department of Sociology').
departments_under_faculty('Faculty of Social Sciences', 'Department of Psychology').
departments_under_faculty('Faculty of Humanities', 'Department of Philology').
departments_under_faculty('Faculty of Humanities', 'Department of History').
departments_under_faculty('Faculty of Economics', 'Department of Economics').
departments_under_faculty('Faculty of Law', 'Department of Law').
department('Department of Computer Science').
about_department_of_computer_science_and_engineering('the Department of Computer Science of Taras Shevchenko University is one of the leading computer science departments in Ukraine. Since its inception in 1991, the Department has played a vital role in developing skilled ICT professionals and researchers. The Department selects high-quality national and international students each academic year. Professor Doctor Ivan Petrov is the current chairman of this department').
chairman_of_cse('Department of Computer Science', 'Professor Doctor Ivan Petrov').
developers('Yana').
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
introduction(X, Y) :-
    name(X),
    breif_description(Y).
history(X, Y) :-
    name(X),
    history(Y).
location(X, Y) :-
    name(X),
    location(Y).
area(X, Y) :-
    name(X),
    area(Y).
first_vice_chancellor(X, Y) :-
    name(X),
    first_vice_chancellor(Y).
vice_chancellor(X, Y) :-
    name(X),
    current_vice_chancellor(Y).
number_of_faculties(X, Y) :-
    name(X),
    number_of_faculties(Y).
number_of_departments(X, Y) :-
    name(X),
    number_of_departments(Y).
number_of_institutes(X, Y) :-
    name(X),
    number_of_institutes(Y).
faculties(X, Y) :-
    name(X),
    faculties(Y).
departments(X, Y) :-
    name(X),
    departments(Y).
departments_under_faculty(X, Y, Z) :-
    name(X),
    faculty(Y),
    departments_under_faculty(Y, Z).
about_department_of_computer_science_and_engineering(X, Y) :-
    name(X),
    about_department_of_computer_science_and_engineering(Y).
