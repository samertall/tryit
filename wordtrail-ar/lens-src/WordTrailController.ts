/** Lens Studio 5/SPECS scaffold ONLY — not compiled or wired via CLAD. */
@component
export class WordTrailController extends BaseScriptComponent {
  @input promptText: Text;
  @input slotsText: Text;
  @input feedbackText: Text;
  @input roundLabel: Text;
  @input revealRoot: SceneObject;
  @input nextButton: SceneObject;
  @input tileLabels: Text[];
  private words = ["CAT","SUN"];
  private tiles = [["T","C","P","A"],["N","M","S","U"]];
  private round = 0;
  private selected = "";
  private done = false;
  onAwake(){this.draw();}
  /** CLAD: connect each SIK/UI Kit button onTrigger to pressTile(index). */
  public pressTile(index:number){
    if(this.done||index<0||index>3)return;
    const c=this.tiles[this.round][index];
    if(c!==this.words[this.round][this.selected.length]){this.feedbackText.text="Try another sound";return;}
    this.selected+=c;this.done=this.selected===this.words[this.round];this.draw();
  }
  public nextRound(){
    if(!this.done)return;
    if(this.round===1){this.feedbackText.text="Both trails complete!";this.nextButton.enabled=false;return;}
    this.round++;this.selected="";this.done=false;this.draw();
  }
  public restartTrail(){this.round=0;this.selected="";this.done=false;this.draw();}
  private draw(){
    const word=this.words[this.round];
    this.roundLabel.text="TRAIL "+(this.round+1)+" / 2";
    this.promptText.text="BUILD "+word;
    this.slotsText.text=word.split("").map((_,i)=>this.selected[i]||"_").join("  ");
    this.feedbackText.text=this.done?"You built "+word+"!":"Pinch the next sound";
    this.revealRoot.enabled=this.done;this.nextButton.enabled=this.done;
    this.tileLabels.forEach((t,i)=>{if(t)t.text=this.tiles[this.round][i];});
  }
}
