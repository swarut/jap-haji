defmodule JapHajiWeb.VerbView do
  use JapHajiWeb, :view
  alias JapHajiWeb.VerbView
  alias JapHaji.API.Verb

  def render("index.json", %{verbs: verbs}) do
    %{data: render_many(verbs, VerbView, "verb.json")}
  end

  def render("show.json", %{verb: verb}) do
    %{data: render_one(verb, VerbView, "verb.json")}
  end

  def render("verb.json", %{verb: verb}) do
    %{id: verb.id,
      midashi: verb.midashi,
      yomi: verb.yomi,
      kumi: verb.kumi,
      polite_present: Verb.polite_present(verb)
    }
  end
end
