module DataStructures
  module SymbolTables
    class LinearProbingHash
      M = 300001
      private_constant :M

      def put(key, value)
        i = hash(key)

        while keys[i]
          break if keys[i] == key
          i = (i + 1) % M
        end

        keys[i] = key
        values[i] = value
      end

      def get(key)
        i = hash(key)

        while keys[i]
          return values[i] if keys[i] == key

          i = (i + 1) % M
        end

        nil
      end

      private

      def values
        @values ||= Array.new(M)
      end

      def keys
        @keys ||= Array.new(M)
      end

      def hash(key)
        (key.hash && 0x7fffffff) % M
      end
    end
  end
end
