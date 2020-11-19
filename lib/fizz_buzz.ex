defmodule FizzBuzz do
  def build(file_name) do
    file_name 
    |>File.read()
    |> handle_file_read()
  end
  
  def handle_file_read({:ok, result }) do
    result = 
      result
      |>String.split(",") # Comentário
      |>Enum.map(&convert_numbers/1)

    {:ok, result}
  end

  def handle_file_read({:error, reason }), do: {:error, "Erro reading the file: #{reason}"}

  def convert_numbers(number) do
    number 
    |>String.to_integer()
    |>evaluate_number()
  end

  def evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do:  :fizzbuzz
  def evaluate_number(number) when rem(number, 3) == 0, do:  :fizz
  def evaluate_number(number) when rem(number, 5) == 0, do:  :buzz
  def evaluate_number(number), do: number
end
