defmodule ChapterFour do
  @moduledoc """
  Implements the code found in chapter four of The Little Schemer
  """
  defp add1(n), do: n + 1
  defp sub1(n), do: n - 1

  @spec plus(number, number) :: number
  @doc """
  `plus` takes in two numbers and returns their sum

  ## Examples
  iex> ChapterFour.plus(46, 12)
  58

  iex> ChapterFour.plus(-1, -2)
  -3

  iex> ChapterFour.plus(1, -3)
  -2

  iex> ChapterFour.plus(-6, 2)
  -4
  """
  def plus(n1, n2) do
    plus_helper(n1, n2, 0)
  end

  defp plus_helper(n1, 0, acc) do
    n1 + acc
  end

  defp plus_helper(n1, n2, acc)
  when n2 < 0 do
    plus_helper(n1, add1(n2), sub1(acc))
  end

  defp plus_helper(n1, n2, acc) do
    plus_helper(n1, sub1(n2), add1(acc))
  end

  @spec minus(number, number) :: number
  @doc"""
  `minus` takes in two numbers and returns their difference
  ## Examples
  iex> ChapterFour.minus(46, 12)
  34

  iex> ChapterFour.minus(3, -1)
  4
  """
  def minus(n1, n2) do
    minus_helper(n1, n2, 0)
  end

  defp minus_helper(n1, 0, acc) do
    n1 - acc
  end

  defp minus_helper(n1, n2, acc)
  when n2 < 0 do
    minus_helper(n1, add1(n2), sub1(acc))
  end

  defp minus_helper(n1, n2, acc) do
    minus_helper(n1, sub1(n2), add1(acc))
  end

  @spec addtup(list(any)) :: number
  @doc """
  `addtup` takes in a list of numbers and returns the result of their sum
  ## Example
  iex> ChapterFour.addtup([1, 2, 3])
  6

  iex> ChapterFour.addtup([1, 2, -3])
  0
  """
  def addtup(l) do
    addtup_helper(l, 0)
  end

  defp addtup_helper([], acc) do
    acc
  end

  defp addtup_helper([head | tail], acc) do
    addtup_helper(tail, plus(acc, head))
  end

  @spec mult(number, number) :: number
  @doc """
  `mult` takes 2 numbers and returns returns their product
  ## Examples
  iex> ChapterFour.mult(2, 3)
  6

  iex> ChapterFour.mult(2, -3)
  -6

  iex> ChapterFour.mult(-2, 3)
  -6

  iex> ChapterFour.mult(3, 0)
  0
  """
  def mult(n1, n2) do
    mult_helper(n1, n2, 0)
  end

  defp mult_helper(_n1, 0, acc) do
    acc
  end

  defp mult_helper(n1, n2, acc)
  when n2 < 0 do
    mult_helper(n1, add1(n2), minus(acc, n1))
  end

  defp mult_helper(n1, n2, acc) do
    mult_helper(n1, sub1(n2), plus(acc, n1))
  end

  @spec sumtup(list(number), list(number)) :: list(number)
  @doc """
    `sumtup` takes two lists of numbers and returns a new list where each element
     is the sum of the corresponding elements from the two input lists.

    It performs element-wise addition, where the first element of the first list
    is added to the first element of the second list, the second element of the
    first list to the second element of the second list, and so on.

    If the lists are of different lengths, the shorter list is treated as
    having a pad of zeroes to the right to match the length of the longer one.

    ## Examples

    iex> ChapterFour.sumtup([1, 1, 1], [2, 2, 2])
    [3, 3, 3]

    iex> ChapterFour.sumtup([3, 4, 5], [1, 2, 3])
    [4, 6, 8]

    iex> ChapterFour.sumtup([1, 2], [0, 0, 3])
    [1, 2, 3]

    iex> ChapterFour.sumtup([0, 0, 3], [1, 2])
    [1, 2, 3]

    ## Notes

    - If given empty lists, the function will return an empty list.
    - The function does not perform type checking on the elements of the lists.
    It's the caller's responsibility to ensure that both lists contain only
    numbers.
  """
  def sumtup(list_a, list_b) do
    sumtup_helper(list_a, list_b, [])
  end

  defp sumtup_helper([], [], acc) do
    acc
    |> Enum.reverse
  end

  defp sumtup_helper([], [head | tail], acc) do
    acc
    |> Enum.reverse
    |> Enum.concat([head | tail])
  end

  defp sumtup_helper([head | tail], [], acc) do
    acc
    |> Enum.reverse
    |> Enum.concat([head | tail])
  end

  defp sumtup_helper([head_a | tail_a], [head_b | tail_b], acc) do
    sumtup_helper(tail_a, tail_b, [plus(head_a, head_b) | acc])
  end

  @spec greater_than(number, number) :: boolean
  @doc """
  `greater_than` takes in two numbers and returns true if the first number is
  larger than the second, otherwise it returns false.

  ## Examples
  iex> ChapterFour.greater_than(5, 3)
  true

  iex> ChapterFour.greater_than(2, 3)
  false

  iex> ChapterFour.greater_than(3, 3)
  false
  """
  def greater_than(0, 0), do: false

  def greater_than(0, _m), do: false

  def greater_than(_n, 0), do: true

  def greater_than(n, m) do
    greater_than(sub1(n), sub1(m))
  end


end
