# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(user_name: 'user_1')
user2 = User.create(user_name: 'user_2')
user3 = User.create(user_name: 'user_3')
user4 = User.create(user_name: 'user_4')
user5 = User.create(user_name: 'user_5')


poll1 = Poll.create(title: "title1", user_id: user1.id)
poll2 = Poll.create(title: "title2", user_id: user2.id)

question1 = Question.create(poll_id: 1, body: "1111111")
question2 = Question.create(poll_id: 1, body: "2222222")
question3 = Question.create(poll_id: 1, body: "3333333")
question4 = Question.create(poll_id: 2, body: "4444444")
question5 = Question.create(poll_id: 2, body: "5555555")
question6 = Question.create(poll_id: 2, body: "6666666")

a_c1 = AnswerChoice.create(question_id: 1, body: '1t1t1t1t1t1')
a_c2 = AnswerChoice.create(question_id: 1, body: '1f1f1f1f1f1')
a_c3 = AnswerChoice.create(question_id: 2, body: '2t2t2t2t2t2')
a_c4 = AnswerChoice.create(question_id: 2, body: '2f2f2f2f2f2')
a_c5 = AnswerChoice.create(question_id: 3, body: '3t3t3t3t3t3')
a_c6 = AnswerChoice.create(question_id: 3, body: '3f3f3f3f3f3')
a_c7 = AnswerChoice.create(question_id: 4, body: '4t4t4t4t4t4')
a_c8 = AnswerChoice.create(question_id: 4, body: '4f4f4f4f4f4')
a_c9 = AnswerChoice.create(question_id: 5, body: '5t5t5t5t5t5')
a_c10 = AnswerChoice.create(question_id: 5, body: '5f5f5f5f5f5')
a_c11 = AnswerChoice.create(question_id: 6, body: '6t6t6t6t6t6')
a_c12 = AnswerChoice.create(question_id: 6, body: '6f6f6f6f6f6')


response1 = Response.create(user_id: 1, answer_choice_id: a_c1.id)
response2 = Response.create(user_id: 2, answer_choice_id: a_c3.id)
response3 = Response.create(user_id: 3, answer_choice_id: a_c4.id)
response4 = Response.create(user_id: 4, answer_choice_id: a_c6.id)
response5 = Response.create(user_id: 4, answer_choice_id: a_c6.id)
