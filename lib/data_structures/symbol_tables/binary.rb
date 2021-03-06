module DataStructures
  module SymbolTables
    class Binary
      def initialize
        @keys = []
        @values = []
      end

      def put(key, value)
        i = rank(key)

        @keys.insert(i, key)
        @values.insert(i, value)
      end

      def empty?
        @keys.empty?
      end

      def delete(key)
        return if empty? || (i = rank(key)) >= @keys.length

        if @keys[i] == key
          @keys.delete_at(i)
          @values.delete_at(i)
        end
      end

      def get(key)
        return if empty? || (i = rank(key)) >= @keys.length

        @values[i] if @keys[i] == key
      end

      private

      def rank(key)
        lo, hi = 0, @keys.length - 1

        while lo <= hi
          mid = lo + (hi - lo) / 2

          comp = key <=> @keys[mid]

          hi = mid - 1 if comp < 0
          lo = mid + 1 if comp > 0

          return mid if comp == 0
        end

        lo
      end
    end
  end
end
