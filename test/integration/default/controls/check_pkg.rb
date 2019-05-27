control 'redis' do

  describe package('redis-server') do
    it { should be_installed }
  end

  describe service('redis') do
    it {should be_enabled}
    it {should be_running}
  end

end
