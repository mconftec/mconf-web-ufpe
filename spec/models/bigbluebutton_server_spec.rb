# This file is part of Mconf-Web, a web application that provides access
# to the Mconf webconferencing system. Copyright (C) 2010-2012 Mconf
#
# This file is licensed under the Affero General Public License version
# 3 or later. See the LICENSE file.

require "spec_helper"

describe BigbluebuttonServer do

  # This is a model from BigbluebuttonRails, but we have permissions set in cancan for it,
  # so we test them here.
  describe "abilities" do
    subject { ability }
    let(:user) { nil }
    let(:ability) { Abilities.ability_for(user) }
    let(:target) { FactoryGirl.create(:bigbluebutton_server) }

    context "a superuser", :user => "superuser" do
      let(:user) { FactoryGirl.create(:superuser) }
      it { should be_able_to(:manage, target) }
    end

    context "a normal user", :user => "normal" do
      let(:user) { FactoryGirl.create(:user) }
      it { should_not be_able_to_do_anything_to(target) }
    end

    context "an anonymous user", :user => "anonymous" do
      it { should_not be_able_to_do_anything_to(target) }
    end
  end

end