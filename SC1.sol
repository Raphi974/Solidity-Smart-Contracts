pragma solidity ^0.4.18;

contract Vote {
    
    //Structures
    struct Votant
    {
        uint id;
        bool VoteComplete;
        uint Choix;
        uint weight;
        
    }
    
    struct Proposition
    {
        bytes32 name;
        uint NbVote;
    }
    
    //Variables
    Proposition[] _possibilites;
    mapping(address => Votant) votants;
    
    
    //Constructor
    function Vote(bytes32[] _allProps)
    {
    for(uint i = 0; i< _allProps.length; i++)
        {
            Proposition _p;
            _p.name =  _allProps[i];
            _p.NbVote = 0;
            _possibilites.push(_p);
        }
    }
    
    
    //Functions
    function Voter(uint _choix)
    {
        Votant _participant;
        if(_participant.VoteComplete){throw;}
        if(_participant.Choix < _possibilites.length)
        {
            _participant.VoteComplete = true;
            _possibilites[_choix].NbVote += 1;
            
        }
        
    }
    
    function winningProposal() constant returns(uint winningProposal)
    {
		uint _winningVoteCount = 0;

		for(uint i = 0; i<_possibilites.length; i++)
		{
			if(_possibilites[i].NbVote > _winningVoteCount)
			{
				_winningVoteCount = _possibilites[i].NbVote;
				winningProposal = i;
			}
		}
	} 
	
	function winner() constant returns (bytes32 winner){

		winner = _possibilites[winningProposal()].name;
	}
	
	
	// KILL function à ajouter ? 
	/*contract Second    // pour eviter cela on creer un owner, si jamais c'est pas le owner pas d'accés sur le construc destruct
{
    address owner;
    modifier isowner()
    {
       if(msg.sender!=owner){throw;
       _;
    }
    }
       function Second()
       {
           owner=msg.sender;
       }
       function kill() isowner()
       {
           delete owner;
           selfdestruct(msg.sender);
       }
}*/
    
    
}
