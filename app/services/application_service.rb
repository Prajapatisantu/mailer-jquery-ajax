class ApplicationService
    def self.call(*args)
      new(*args).call
    end

    def self.prd(*args)
        new(*args).prd
    end
end