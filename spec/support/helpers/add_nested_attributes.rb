def add_tasks(number = 2)
  number.times { find("div", id: "add-task").click }
  titles = find_all_by_id('input', /project_tasks_attributes_\d*_title/)
  descriptions = find_all_by_id('textarea', /project_tasks_attributes_\d*_description/ )
  titles.each_with_index {|title, n| title.fill_in(with: "Task #{n + 1}") }
  descriptions.each_with_index {|title, n| title.fill_in(with: "Small description for task number #{n + 1}") }
end

def fill_project_fields(title)
  fill_in('project_title', with: title)
  fill_in('project_description', with: "La mise en abyme — également orthographiée mise en abysme ou plus rarement mise en abîme1 — est un procédé consistant à représenter une œuvre dans une œuvre similaire, par exemple dans les phénomènes de « film dans un film », ou encore en incrustant dans une image cette image elle-même (en réduction).")
end

def add_comments(number = 2)
  add_comment_buttons = all('button', text: 'Add Comment')
  add_comment_buttons.each {|b| number.times { b.click } }
  comment_contents = find_all_by_id('input', /content/)
  comment_contents.each_with_index {|c, n| c.fill_in(with: "Comment ##{n}") }
end

def add_participants(number = 2)
  number.times { click_on("Add Participant") }
  within('div[data-model="participants"]') do
    emails = all("input")
    emails.each_with_index {|input, index| input.fill_in(with: "email_#{index}@gmail.com") }
  end
end