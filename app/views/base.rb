# frozen_string_literal: true

class Views::Base < Components::Base
  include Phlex::Rails::Helpers::StylesheetLinkTag
  include Phlex::Rails::Helpers::JavascriptImportmapTags
  include Phlex::Rails::Helpers::CSRFMetaTags
  include Phlex::Rails::Helpers::CSPMetaTag

  def around_template
    doctype

    html do
      head do
        title { page_title }
        meta name: "viewport", content: "width=device-width,initial-scale=1"
        meta name: "apple-mobile-web-app-capable", content: "yes"
        meta name: "mobile-web-app-capable", content: "yes"
        csrf_meta_tags
        csp_meta_tag
        # If you use content_for(:head) in your views, render it here:
        unsafe_raw content_for(:head) if respond_to?(:content_for)
        # Uncomment if you use a PWA manifest:
        # link rel: "manifest", href: pwa_manifest_path(format: :json)
        link rel: "icon", href: "/icon.png", type: "image/png"
        link rel: "icon", href: "/icon.svg", type: "image/svg+xml"
        link rel: "apple-touch-icon", href: "/icon.png"
        stylesheet_link_tag :app, "data-turbo-track": "reload"
        javascript_importmap_tags
      end

      body do
        main class: "container mx-auto mt-10 px-5 flex" do
          super
        end
      end
    end
  end
end
