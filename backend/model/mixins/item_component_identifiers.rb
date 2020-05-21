module ItemComponentIdentifiers

  def self.included(base)
    base.repo_unique_constraint(:component_id,
                                :message => "Component Identifier already in use",
                                :json_property => :component_id)
  end
end
