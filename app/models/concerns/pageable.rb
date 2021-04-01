# rubocop:disable Style/ClassVars
module Pageable
  @@current_element = 0
  @@cache = {}

  def cached_page(page, keyword) = @@cache[keyword][page]

  def cache_page(page, keyword, result) = @@cache[keyword][page] = result

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
      collection << build(keyword)
      next_element_id
    end
    collection
  end
end
# rubocop:enable Style/ClassVars
