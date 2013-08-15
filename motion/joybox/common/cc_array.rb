class CCArray
    include Enumerable

    def [] index
        self.objectAtIndex(index)
    end

    def each(&blk)
        self.getNSArray.each(&blk)
    end
end
