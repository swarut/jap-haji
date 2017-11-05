# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JapHaji.Repo.insert!(%JapHaji.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias JapHaji.API.Verb
alias JapHaji.Repo

Repo.insert! %Verb{
  midashi: "使う",
  yomi: "つかう",
  kumi: ""
}

Repo.insert! %Verb{
  midashi: "食べる",
  yomi: "たべる",
  kumi: ""
}

Repo.insert! %Verb{
  midashi: "含む",
  yomi: "ふくむ",
  kumi: ""
}

Repo.insert! %Verb{
  midashi: "呼ぶ",
  yomi: "よぶ",
  kumi: ""
}

Repo.insert! %Verb{
  midashi: "読む",
  yomi: "よむ",
  kumi: ""
}
