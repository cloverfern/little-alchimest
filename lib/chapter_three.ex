defmodule ChapterThree do
  @moduledoc """
  Implements the code found in chapter three of The Little Schemer
  """

  @doc """
  takes an atom and a list and removes the first instance of that atom. tail call optimized

  ## Examples

      iex> ChapterThree.rember(:a, [])
      []

      iex> ChapterThree.rember(:b, [:a, :b, :c])
      [:a, :c]

      iex> ChapterThree.rember(:a, [:a, :b, :c, :a])
      [:b, :c, :a]
  """
  @spec rember(any, list(any)) :: list(any)
  def rember(item, list) do
    rember_helper(item, list, [])
  end

  defp rember_helper(_item, [], acc), do: Enum.reverse(acc)

  defp rember_helper(item, [item | tail], acc) do
    acc
    |> Enum.reverse()
    |> Enum.concat(tail)
  end

  defp rember_helper(item, [head | tail], acc) do
    rember_helper(item, tail, [head | acc])
  end

  @doc """
  takes a list of lists and returns the first element of each list

  ## Examples

      iex> ChapterThree.firsts([])
      []

      iex> ChapterThree.firsts([[:a, :b], [:c, :d]])
      [:a, :c]

      iex> ChapterThree.firsts([[[:a, :b], :c], [:d, :e]])
      [[:a, :b], :d]
  """
  @spec firsts(list(any)) :: list(any)
  def firsts(list) do
    firsts_helper(list, [])
  end

  defp firsts_helper([], acc), do: Enum.reverse(acc)

  defp firsts_helper([[head | _rest] | tail], acc) do
    firsts_helper(tail, [head | acc])
  end

@doc"""
inserts new to the right of old.

## Examples
    iex> ChapterThree.insertR(:b, :a, [])
    []

    iex> ChapterThree.insertR(:b, :a, [:a, :c])
    [:a, :b, :c]

    iex> ChapterThree.insertR(:c, :b, [:a, :b])
    [:a, :b, :c]
"""
@spec insertR(any, any, list(any)) :: list (any)
def insertR(new, old, l) do
  insertR_helper(new, old, l, [])
end

defp insertR_helper(_new, _old, [], acc), do: Enum.reverse(acc)

defp insertR_helper(new, old, [old | tail], acc) do
  acc
  |> Enum.reverse()
  |> Enum.concat([old, new | tail])
end

defp insertR_helper(new, old, [head | tail], acc) do
  insertR_helper(new, old, tail, [head | acc])
end

@doc"""
inserts new to the left of old.

## Examples
    iex> ChapterThree.insertL(:b, :a, [])
    []

    iex> ChapterThree.insertL(:a, :b, [:b, :c])
    [:a, :b, :c]

    iex> ChapterThree.insertL(:b, :c, [:a, :c])
    [:a, :b, :c]
"""
@spec insertL(any, any, list(any)) :: list (any)
def insertL(new, old, l) do
  insertL_helper(new, old, l, [])
end

defp insertL_helper(_new, _old, [], acc), do: Enum.reverse(acc)

defp insertL_helper(new, old, [old | tail], acc) do
  acc
  |> Enum.reverse()
  |> Enum.concat([new, old | tail])
end

defp insertL_helper(new, old, [head | tail], acc) do
  insertL_helper(new, old, tail, [head | acc])
end

@doc"""
substitutes first occurrence of old with new.

## Examples
    iex> ChapterThree.subst(:b, :a, [])
    []

    iex> ChapterThree.subst(:b, :a, [:a, :c])
    [:b, :c]

    iex> ChapterThree.subst(:c, :b, [:a, :b])
    [:a, :c]
"""
@spec subst(any, any, list(any)) :: list (any)
def subst(new, old, l) do
  subst_helper(new, old, l, [])
end

defp subst_helper(_new, _old, [], acc), do: Enum.reverse(acc)

defp subst_helper(new, old, [old | tail], acc) do
  acc
  |> Enum.reverse()
  |> Enum.concat([new | tail])
end

defp subst_helper(new, old, [head | tail], acc) do
  subst_helper(new, old, tail, [head | acc])
end

@doc"""
substitutes either the first occurrence of o1 or the first occurrence of o2 with new.

## Examples
    iex> ChapterThree.subst2(:b, :a, :c, [])
    []

    iex> ChapterThree.subst2(:b, :a, :d, [:a, :c])
    [:b, :c]

    iex> ChapterThree.subst2(:c, :d, :b, [:a, :b, :d])
    [:a, :c, :d]

    iex> ChapterThree.subst2(:c, :x, :d, [:a, :b, :d])
    [:a, :b, :c]
"""
@spec subst2(any, any, any, list(any)) :: list (any)
def subst2(new, o1, o2, l) do
  subst2_helper(new, o1, o2, l, [])
end

defp subst2_helper(_new, _o1, _o2, [], acc), do: Enum.reverse(acc)

defp subst2_helper(new, o1, _o2, [o1 | tail], acc) do
  acc
  |> Enum.reverse()
  |> Enum.concat([new | tail])
end

defp subst2_helper(new, _o1, o2, [o2 | tail], acc) do
  acc
  |> Enum.reverse()
  |> Enum.concat([new | tail])
end

defp subst2_helper(new, o1, o2, [head | tail], acc) do
  subst2_helper(new, o1, o2, tail, [head | acc])
end

  @doc """
  takes an atom and a list and removes the first instance of that atom

  ## Examples

      iex> ChapterThree.multirember(:a, [])
      []

      iex> ChapterThree.multirember(:b, [:a, :b, :c])
      [:a, :c]

      iex> ChapterThree.multirember(:a, [:a, :b, :c, :a])
      [:b, :c]
  """
  @spec multirember(any, list(any)) :: list(any)
  def multirember(item, list) do
    multirember_helper(item, list, [])
  end

  defp multirember_helper(_item, [], acc), do: Enum.reverse(acc)

  defp multirember_helper(item, [item | tail], acc) do
    multirember_helper(item, tail, acc)
  end

  defp multirember_helper(item, [head | tail], acc) do
    multirember_helper(item, tail, [head | acc])
  end

@doc"""
inserts new to the right of every occurrence of old.

## Examples
    iex> ChapterThree.multiinsertR(:b, :a, [])
    []

    iex> ChapterThree.multiinsertR(:b, :a, [:a, :c, :a])
    [:a, :b, :c, :a, :b]

    iex> ChapterThree.multiinsertR(:c, :b, [:a, :b, :b])
    [:a, :b, :c, :b, :c]
"""
@spec multiinsertR(any, any, list(any)) :: list (any)
def multiinsertR(new, old, l) do
  multiinsertR_helper(new, old, l, [])
end

defp multiinsertR_helper(_new, _old, [], acc), do: Enum.reverse(acc)

defp multiinsertR_helper(new, old, [old | tail], acc) do
  multiinsertR_helper(new, old, tail, [new, old | acc])
end

defp multiinsertR_helper(new, old, [head | tail], acc) do
  multiinsertR_helper(new, old, tail, [head | acc])
end

@doc"""
inserts new to the left of every occurrence of old.

## Examples
    iex> ChapterThree.multiinsertL(:b, :a, [])
    []

    iex> ChapterThree.multiinsertL(:b, :a, [:a, :c, :a])
    [:b, :a, :c, :b, :a]

    iex> ChapterThree.multiinsertL(:c, :b, [:a, :b, :b])
    [:a, :c, :b, :c, :b]
"""
@spec multiinsertL(any, any, list(any)) :: list (any)
def multiinsertL(new, old, l) do
  multiinsertL_helper(new, old, l, [])
end

defp multiinsertL_helper(_new, _old, [], acc), do: Enum.reverse(acc)

defp multiinsertL_helper(new, old, [old | tail], acc) do
  multiinsertL_helper(new, old, tail, [old, new | acc])
end

defp multiinsertL_helper(new, old, [head | tail], acc) do
  multiinsertL_helper(new, old, tail, [head | acc])
end

@doc"""
substitutes every occurrence of old with new.

## Examples
    iex> ChapterThree.multisubst(:b, :a, [])
    []

    iex> ChapterThree.multisubst(:b, :a, [:a, :c, :a])
    [:b, :c, :b]
"""
@spec multisubst(any, any, list(any)) :: list (any)
def multisubst(new, old, l) do
  multisubst_helper(new, old, l, [])
end

defp multisubst_helper(_new, _old, [], acc), do: Enum.reverse(acc)

defp multisubst_helper(new, old, [old | tail], acc) do
  multisubst_helper(new, old, tail, [new | acc])
end

defp multisubst_helper(new, old, [head | tail], acc) do
  multisubst_helper(new, old, tail, [head | acc])
end

end
