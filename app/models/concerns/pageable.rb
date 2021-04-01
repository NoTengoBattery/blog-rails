# rubocop:disable Style/ClassVars
module Pageable
  @@current_element = 0

  def current_element_id() = @@current_element || 0

  def next_element_id() = @@current_element += 1

  def page_id() = ((@@current_element + 1) / self::PAGGER.to_f).ceil

  def element_offset_id() = @@current_element % self::PAGGER

  def element_id=(element)
    @@current_element = element if element.integer?
  end
end
# rubocop:enable Style/ClassVars
