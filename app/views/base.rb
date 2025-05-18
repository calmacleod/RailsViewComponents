# frozen_string_literal: true

class Views::Base < Components::Base
  def around_template
    doctype

    html do
      head do
        title { page_title }
      end

      body { super }
    end
  end
end
