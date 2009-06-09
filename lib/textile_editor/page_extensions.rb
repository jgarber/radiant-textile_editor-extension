module TextileEditor::PageExtensions
  def self_or_ancestors_have_attachments?
    return false unless self.respond_to?(:attachments)
    ([self] + self.ancestors).each do |page|
      return true if page.attachments.any?
    end
    return false
  end
  
  def self_and_ancestors
    collection = [self]
    collection += self.ancestors if self.ancestors
    collection
  end
  
end