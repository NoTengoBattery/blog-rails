# rubocop:disable Style/ClassVars
module Pageable
  @@current_element = 0

  def current_element_id() = @@current_element

  def next_element_id() = @@current_element += 1

  def page_id() = ((@@current_element + 1) / self::PAGGER.to_f).ceil

  def element_offset_id() = @@current_element % self::PAGGER

  def element_id=(element)
    @@current_element = element if element.integer?
  end

  def page(number, keyword)
    self.element_id = (number - 1) * self::PAGGER
    collection = []
    self::PAGGER.times do
      built = build(keyword)
      collection << built if built.valid?
      next_element_id
    end
    collection
  end
end
# rubocop:enable Style/ClassVars
