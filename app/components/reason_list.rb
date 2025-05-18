class Components::ReasonList < Components::Base
  def initialize(reasons:)
    @reasons = reasons
  end

  def view_template
    h2 { "Here are some reasons why you should use my app:" }

    ul do
      @reasons.each do |reason|
        li { reason }
      end
    end
  end
end
