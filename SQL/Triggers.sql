-- Trigger to notify negative account

delimiter $$

create trigger Employer_balance_check 
 after update on Employer for each row
  begin
       if new.Employer.Emoloyer_Balance < 0.00
       then signal SQLState'45000' set MESSAGE_TEXT = 'The balance is negative and the account will be frozen';
       end if;
   
  end;
 
$$

delimiter ;

delimiter $$

create trigger Candidate_balance_check 
 after update on Candidate for each row
  begin
       if new.Candidate.Candidate_Balance < 0.00
       then signal SQLState'45000' set MESSAGE_TEXT = 'The balance is negative and the account will be frozen';
       end if;
   
  end;
 
$$

delimiter ;



delimiter $$

create trigger Employer_Membership_Res 
 before insert on EmployerMembership for each row
  begin
       if new.Genre = 'Prime' AND new.MaxJobPost > 5 
       then signal SQLState'45000'set MESSAGE_TEXT = 'Employer can post up to five jobs.';
	   end if;
       
  end;
 
$$

delimiter ;


delimiter $$

create trigger Candidate_Membership_Res 
 before insert on CandidateMembership for each row
  begin
       if new.Genre = 'Prime' AND new.MaxJobApply > 5 
       then signal SQLState'45000'set MESSAGE_TEXT = 'Employee can view jobs as well as apply for up to five jobs.';
	   end if;
       
  end;
 
$$

delimiter ;