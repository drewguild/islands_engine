defmodule IslandTest do
    use ExUnit.Case

    import IslandsEngine.{Coordinate, Island}
    
    test "creates a square island" do
        square = IslandsEngine.Island.new(:square, {1, 1})

        expected = MapSet.new([{1, 1}, {1, 2}, {2, 1}, {2, 2}], fn {row, col} -> 
            {_, coordinate} = IslandsEngine.Coordinate.new(row, col)
            coordinate
        end)

       assert Map.get(square, :coordinates) == expected 
    end

    test "creates an atoll island" do
        atoll = IslandsEngine.Island.new(:atoll, {1, 1})

        expected = MapSet.new([{1, 1}, {1, 2}, {2, 2}, {3, 1}, {3, 2}], fn {row, col} -> 
            {_, coordinate} = IslandsEngine.Coordinate.new(row, col)
            coordinate
        end)

        assert Map.get(atoll, :coordinates) == expected
    end
end