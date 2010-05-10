$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib', 'tweet_utils'))
require 'timeslots'

describe 'timeslots' do

  it 'should calculate time since epoch' do
    timeslots = TimeSlots.new 5.minutes
    timeslots.timeslot_since_epoch('Mon Jan 20 10:22:59 +0000 2010').should == 0
    timeslots.timeslot_since_epoch('Mon Jan 20 10:26:59 +0000 2010').should == 0
    timeslots.timeslot_since_epoch('Mon Jan 20 10:28:59 +0000 2010').should == 1
  end

  it 'should calculate correct daily timeslot' do
    timeslots = TimeSlots.new 5.minutes
    timeslots.daily_timeslot_for('Mon Jan 20 00:02:59 +0000 2010').should == 0
    timeslots.daily_timeslot_for('Mon Jan 20 00:22:59 +0000 2010').should == 4
    timeslots = TimeSlots.new 15.minutes
    timeslots.daily_timeslot_for('Mon Jan 20 00:02:59 +0000 2010').should == 0
    timeslots.daily_timeslot_for('Mon Jan 20 00:22:59 +0000 2010').should == 1
    timeslots = TimeSlots.new 25.minutes
    timeslots.daily_timeslot_for('Mon Jan 20 00:02:59 +0000 2010').should == 0
    timeslots.daily_timeslot_for('Mon Jan 20 00:22:59 +0000 2010').should == 0
  end

=begin
  it 'should calculate correct weekly timeslot' do
    timeslots = TimeSlots.new 25.minutes
    timeslots.weekly_timeslot_for('Mon Jan 20 00:02:59 +0000 2010').should == 0
    timeslots.weekly_timeslot_for('Mon Jan 20 00:22:59 +0000 2010').should == 4
  end
=end

end

