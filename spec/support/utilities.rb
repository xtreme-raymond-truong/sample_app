def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def title_test(header, suffix)
  it { should have_selector('h1',    text: header) }
  it { should have_selector('title', text: full_title(suffix)) }
end