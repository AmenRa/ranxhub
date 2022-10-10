module Jekyll
  module PrecisionFilter
    def precision(input, value=0)
      ("%.#{value}f" % input.round(2))
    end
  end
end

Liquid::Template.register_filter(Jekyll::PrecisionFilter)