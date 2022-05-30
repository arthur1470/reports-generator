defmodule ReportsGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "report_test.csv"

      response =
        file_name
        |> ReportsGenerator.build()

      expected_response = %{
        "foods" => %{
          "açaí" => 0,
          "churrasco" => 1,
          "esfirra" => 1,
          "hambúrguer" => 0,
          "pastel" => 0,
          "pizza" => 0,
          "prato_feito" => 0,
          "sushi" => 0
        },
        "users" => %{
          "1" => 0,
          "10" => 0,
          "11" => 0,
          "12" => 0,
          "13" => 0,
          "14" => 0,
          "15" => 0,
          "16" => 0,
          "17" => 0,
          "18" => 0,
          "19" => 0,
          "2" => 0,
          "20" => 0,
          "21" => 0,
          "22" => 0,
          "23" => 0,
          "24" => 0,
          "25" => 0,
          "26" => 0,
          "27" => 0,
          "28" => 0,
          "29" => 0,
          "3" => 0,
          "30" => 0,
          "4" => 0,
          "5" => 0,
          "6" => 0,
          "7" => 0,
          "8" => 25,
          "9" => 24
        }
      }

      assert response == expected_response
    end
  end

  describe "fetch_higher_cost/2" do
    test "return the higher cost by users" do
      file_name = "report_test.csv"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("users")

      expected_response = {:ok, {"8", 25}}

      assert response == expected_response
    end

    test "return the higher cost by food" do
      file_name = "report_test.csv"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("foods")

      expected_response = {:ok, {"churrasco", 1}}

      assert response == expected_response
    end

    test "when option is incorrect" do
      file_name = "report_test.csv"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("banana")

      expected_response = {:error, "Invalid option"}

      assert response == expected_response
    end
  end
end
