class Components::ReasonList < Components::Base
  def initialize(reasons:)
    @reasons = reasons
  end

  def view_template
    h2(class: "text-lg font-bold") { "Here are some reasons why you should use my app:" }

    ul class: "list-disc list-inside" do
      @reasons.each do |reason|
        li { reason }
      end
    end
  end
end
