module ApplicationHelper

  def link_to_revue_gem(text = "revue gem", opts = {}, &block)
    url = "https://rubygems.org/gems/revue"
    if block_given?
      link_to url, opts, &block
    else
      link_to text, url, opts, &block
    end
  end

end
