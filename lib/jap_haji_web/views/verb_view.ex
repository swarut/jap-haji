defmodule JapHajiWeb.VerbView do
  use JapHajiWeb, :view
  alias JapHajiWeb.VerbView

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
      kumi: verb.kumi
    }
  end
end
