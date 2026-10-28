/** Original browser-concept logic; NOT a compiled Lens Studio artifact. */
export const LEVELS = [
  {word:"cat",tiles:["t","c","p","a"],clue:"A furry pet that says meow",emoji:"CAT"},
  {word:"sun",tiles:["n","m","s","u"],clue:"The bright light in the daytime sky",emoji:"SUN"}
];
export const createGame=()=>({round:0,selection:"",mistakes:0,status:"ready",feedback:"Pinch the first sound"});
export const currentLevel=s=>LEVELS[s.round];
export function selectLetter(s,letter){
  if(s.status==="complete"||s.status==="finished")return {state:s,event:"blocked"};
  const l=currentLevel(s);
  if(!l.tiles.includes(letter))throw Error("Invalid letter");
  if(letter!==l.word[s.selection.length]){
    return {state:{...s,mistakes:s.mistakes+1,status:"playing",feedback:"Try another sound"},event:"incorrect"};
  }
  const selection=s.selection+letter;
  const complete=selection===l.word;
  return {state:{...s,selection,status:complete?"complete":"playing",feedback:complete?"You built "+l.word.toUpperCase()+"!":"Great! Find the next sound"},event:complete?"complete":"correct"};
}
export function advance(s){
  if(s.status!=="complete")return {state:s,event:"not-ready"};
  if(s.round===LEVELS.length-1)return {state:{...s,status:"finished",feedback:"Both trails complete!"},event:"finished"};
  return {state:{round:s.round+1,selection:"",mistakes:s.mistakes,status:"ready",feedback:"New trail! Pinch the first sound"},event:"next"};
}
export const restart=createGame;
