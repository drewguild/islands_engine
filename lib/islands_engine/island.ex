defmodule IslandsEngine.Island do
    alias IslandsEngine.{Coordinate, Island}

    @enforce_keys [:coordinates, :hit_coordinates]
    defstruct [:coordinates, :hit_coordinates]

    def new(type, location) do
        coords = coordinates(type, location)

        %Island{coordinates: MapSet.new(coords), hit_coordinates: MapSet.new()}
    end
    # def new do
    #     %Island{coordinates: MapSet.new(), hit_coordinates: MapSet.new()}
    # end

    defp coordinates(type, {row, col}) do 
        Enum.map([{0, 0}, {0, 1}, {1, 0}, {1, 1}], fn {row_offset, col_offset} ->
            {:ok, coordinate} = IslandsEngine.Coordinate.new(row + row_offset, col + col_offset)
            coordinate
        end)
    end
end