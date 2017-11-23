defmodule JapHaji.LangTest do
  use JapHaji.DataCase

  alias JapHaji.Lang

  describe "lang" do


    # @valid_attrs %{kumi: "some kumi", midashi: "some midashi", yomi: "some yomi"}
    # @update_attrs %{kumi: "some updated kumi", midashi: "some updated midashi", yomi: "some updated yomi"}
    # @invalid_attrs %{kumi: nil, midashi: nil, yomi: nil}

    # def verb_fixture(attrs \\ %{}) do
    #   {:ok, verb} =
    #     attrs
    #     |> Enum.into(@valid_attrs)
    #     |> API.create_verb()
    #
    #   verb
    # end

    test "shift/2 transform the right character" do
      assert Lang.shift("あ", :i) == "い"
    end

    test "shift_suffix/2 transforms the suffix character" do
      assert Lang.shift_suffix("話す", :i) == "話し"
    end


  end
end
