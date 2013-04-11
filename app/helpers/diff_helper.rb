module DiffHelper
  def diff_bar(diff)
    proportion = case diff.proportion_of_deleted_lines
    when 0
      "none"
    when 1..33
      "quarter"
    when 34..65
      "half"
    when 66..99
      "three_quarters"
    when 100
      "full"
    end
    content_tag :div, class: 'diff_bar' do
      content_tag :div, class: "deleted_lines #{proportion}" do
      end
    end
  end
end