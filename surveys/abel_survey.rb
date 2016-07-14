survey "Abel survey", default_mandatory: false do
  section "General Information" do
    label "These questions are about General Information"

    question "What's your name?", is_mandatory: true
    answer :string

    question "What's your birthday?", is_mandatory: true
    answer :date

    question "What is your favourite sport?", pick: :one
    answer "Soccer"
    answer "Baseball"
    answer "Basketball"
    answer "Football"

    q_2 "What country would you like to know?", pick: :any
    a_1 "Spain"
    a_2 "China"
    a_3 "Brazil"
    a_4 "France"
    a_5 "Canada"
    a_6 "Mexico"
    a :omit
  end

  section "Developer Information" do
    grid "What is your experience level in the following languages?" do
      a "Poor"
      a "Medium"
      a "Advanced"
      q "Javascript", pick: :one
      q "HTML", pick: :one
      q "CSS", pick: :one
      q "Ruby", pick: :one
      q "Rails", pick: :one
      q "SASS", pick: :one
      q "CoffeeScript", pick: :one
    end

    q_db "What is your favorite DB?", pick: :one
    a_db_1 "MySQL"
    a_db_2 "PostgreSQL"
    a_db_3 "Oracle"
    a_db_4 "SQL Server"
    a_db_5 "MongoDB"
    a_db_6 "DynamoDB"

    q_editor "Which editor/IDE do you use?", pick: :any
    a_editor_1 "Visual Studio"
    a_editor_2 "Eclipse"
    a_editor_3 "Sublime Text"
    a_editor_4 "Vim"
    a_editor_5 "Emacs"
    a_editor_6 "Atom"

    q_php "Do you like PHP?", pick: :one
    a_y "Yes"
    a_n "No"

    repeater "Tell us more about your PHP experience" do
      dependency rule: "A"
      condition_A :q_php, "==", :a_y

      q "Which frameworks have you worked?", pick: :any
      a "Laravel"
      a "CodeIgniter"
      a "CakePHP"
      a "Symfony"
      a "Zend Framework 2"
      a "Yii"
    end

    repeater "Tell us more about your PHP experience" do
      dependency rule: "B"
      condition_B :q_php, "==", :a_n
      q "Why?"
      a :string
    end
  end
end
