class GemExtensions::BreadcrumbsOnRails::CustomBuilder < BreadcrumbsOnRails::Breadcrumbs::SimpleBuilder
  def render
    @elements.collect { |element| render_element(element) }.join(separator)
  end

  def render_element(element)
    content = compute_content(element)
    @context.content_tag(:span, content)
  end

  private
    def compute_content(element)
      name = compute_name(element)
      path = compute_path(element)

      return current_content(name) if element == @elements.last
      return name if element.path == nil
      @context.link_to(name, path, element.options)
    end

    def current_content(content)
      @context.content_tag(:strong, content, class: "vb__breadcrumbs__current")
    end

    def separator
      @context.content_tag(:span, nil, class: "vb__breadcrumbs__arrow")
    end
end