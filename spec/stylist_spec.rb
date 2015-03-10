require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID number") do
      test_stylist = Stylist.new({:stylist_name => "Asher London", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist_name => "Ashley Purdy", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#stylist_name") do
    it("tells you its name") do
      style = Stylist.new({:stylist_name => "Asher London", :id => nil})
      expect(style.stylist_name()).to(eq("Asher London"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      style = Stylist.new({:stylist_name => "Asher London", :id => nil})
      style.save()
      expect(style.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      style = Stylist.new({:stylist_name => "Asher London", :id => nil})
      style.save()
      expect(Stylist.all()).to(eq([style]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      style1 = Stylist.new({:stylist_name => "Asher London", :id => nil})
      style2 = Stylist.new({:stylist_name => "Asher London", :id => nil})
      expect(style1).to(eq(style2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:stylist_name => "Asher London", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Lauren Doe", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Sally Brooks", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe("#update") do
  it("lets you update stylists in the database") do
    test_stylist = Stylist.new({:stylist_name => "Asher London", :id => nil})
    test_stylist.save()
    test_stylist.update({:stylist_name => "Ashley Purdy"})
    expect(test_stylist.stylist_name()).to(eq("Ashley Purdy"))
  end
end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      test_stylist = Stylist.new({:stylist_name => "Asher London", :id => nil})
      test_stylist.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end

    it("deletes a stylist's clients from the database") do
      test_stylist = Stylist.new({:stylist_name => "Asher London", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Lauren Doe", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Sally Brooks", :stylist_id => test_stylist.id()})
      test_client2.save()
      test_stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
