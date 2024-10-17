
from pyswip import Prolog
import time
import json

def prolog_query(query_string):
    prolog = Prolog()
    prolog.consult("knowledge.pl")
    results = []
    for res in prolog.query(query_string):
        results.append(res)
    return results

def ask_question(query_string):
    answers = prolog_query(query_string)
    return answers

def make_json(data):
    json_str = ""
    for c in data:
        if c == "'":
            json_str += '"'
            continue
        json_str += c
    return json_str

def say_answers(prefix, suffix, question_i, answers_i):
    for ansi in answers_i:
        ansi = make_json(str(ansi))
        obj = json.loads(str(ansi))
        print(obj[question_i])
        text = prefix + " " + obj[question_i] + " " + suffix
        print(">>>> ", text)

print(
    "Hi, I'm here to tell you about Taras Shevchenko University. \
                what do you want to know about Taras Shevchenko University?"
)
flg = True
while flg:
    # Q/A
    print("\n\n")
    asked_question = str(input("what is in your mind: ")).lower()
    if (
        "name of the university" in asked_question
        or "university name" in asked_question
    ):
        # Q: what is the name of the university?
        question = "UniversityName"
        query = "name(" + question + ")."
        answers = ask_question(query)
        say_answers("The name of the university ", "", question, answers)
    elif (
        "introduction" in asked_question
        or "about ju" in asked_question
        or "about taras shevchenko university" in asked_question
    ):
        # Q: what is Taras Shevchenko University?
        question = "Introduction"
        query = "introduction('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("", "", question, answers)
    elif (
        "history of ju" in asked_question
        or "history of taras shevchenko university" in asked_question
    ):
        # Q: history of Taras Shevchenko University.
        question = "History"
        query = "history('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("Brief history: ", "", question, answers)
    elif (
        "location of taras shevchenko university" in asked_question
        or "situated" in asked_question
    ):
        # Q: where is Taras Shevchenko University?
        question = "Location"
        query = "location('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("", "", question, answers)
    elif "area of taras shevchenko university" in asked_question:
        # Q: area of Taras Shevchenko University?
        question = "Area"
        query = "area('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers(
            "Total area of Taras Shevchenko University is about ", "", question, answers
        )
    elif (
        "current" in asked_question
        or "present" in asked_question
        or "now" in asked_question
    ) and ("vice chancellor" in asked_question or "vc" in asked_question):
        # Q: who is the current vice chancellor of Taras Shevchenko University?
        question = "Vice_chancellor"
        query = "vice_chancellor('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers(
            "The current vice chancellor of Taras Shevchenko University is ",
            "",
            question,
            answers,
        )
    elif (
        "number of faculties" in asked_question
        or "how many faculties" in asked_question
        and asked_question.find("faculty of") == -1
    ):
        # Q how many faculties are in Taras Shevchenko University
        question = "Number_of_faculties"
        query = "number_of_faculties('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("Total faculties: ", "", question, answers)
    elif (
        "number of departments" in asked_question
        or "how many departments" in asked_question
        and asked_question.find("department of") == -1
    ):
        # Q how many departments are in Taras Shevchenko University
        question = "Number_of_departments"
        query = "number_of_departments('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("Total departments: ", "", question, answers)
    elif (
        "number of institutes" in asked_question
        or "how many institutes" in asked_question
    ):
        # Q how many institutes are in Taras Shevchenko University
        question = "Number_of_institutes"
        query = "number_of_institutes('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("Total institutes: ", "", question, answers)
    elif (
        "faculties of taras shevchenko university" in asked_question
        or "faculties" in asked_question
    ):
        # Q what are the faculties of Taras Shevchenko University?
        question = "Faculties"
        query = "faculties('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("Faculties are: ", "", question, answers)
    elif (
        "departments of taras shevchenko university" in asked_question
        or "departments" in asked_question
    ):
        # Q what are the departments of Taras Shevchenko University?
        question = "Departments"
        query = "departments('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("Departments are: ", "", question, answers)
    elif "departments under" in asked_question:
        # Q what are the departments under specific faculty?
        faculty_name = asked_question.split("under")[-1].strip()
        question = "Department"
        query = f"departments_under_faculty('{faculty_name}', 'taras_shevchenko_uni', {question})."
        answers = ask_question(query)
        say_answers("Departments under faculty of " + faculty_name + ": ", "", question, answers)
    elif (
        "about department of computer science" in asked_question
        or "about cse" in asked_question
    ):
        # Q: about the Department of Computer Science
        question = "Department_of_Computer_Science"
        query = "about_department_of_computer_science_and_engineering('taras_shevchenko_uni', " + question + ")."
        answers = ask_question(query)
        say_answers("About Department of Computer Science: ", "", question, answers)
    elif (
        "chairman of computer science" in asked_question
        or "who is the chairman of computer science" in asked_question
    ):
        # Q: who is the chairman of the Department of Computer Science?
        question = "Chairman_of_CSE"
        query = "chairman_of_cse('Department of Computer Science', " + question + ")."
        answers = ask_question(query)
        say_answers("Chairman of Department of Computer Science: ", "", question, answers)
    elif (
        "developers" in asked_question
        or "who developed" in asked_question
    ):
        # Q: who developed the code?
        question = "Developers"
        query = "developers('yana', " + question + ")."
        answers = ask_question(query)
        say_answers("Developers: ", "", question, answers)
    else:
        print("Sorry, I cannot understand your question.")
    
    cont = input("Do you want to ask more? (y/n): ")
    if cont.lower() != 'y':
        flg = False
print("Thank you for your time!")
