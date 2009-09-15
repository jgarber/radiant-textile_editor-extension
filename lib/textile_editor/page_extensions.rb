module TextileEditor::PageExtensions
  def ancestor_attachments_count
    return 0 unless self.respond_to?(:attachments)
    self.ancestors.inject(0) do |count, page|
      count + page.attachments.count
    end
  end
  
  def self_and_ancestors
    collection = [self]
    collection += self.ancestors if self.ancestors
    collection
  end
  
end