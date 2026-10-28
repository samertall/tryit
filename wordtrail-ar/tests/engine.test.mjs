import test from "node:test";
import assert from "node:assert/strict";
import {createGame,selectLetter,advance,restart} from "../core/wordtrail-engine.mjs";
test("correct spelling of CAT unlocks reveal",()=>{
 let s=createGame();for(const c of "cat")s=selectLetter(s,c).state;
 assert.equal(s.selection,"cat");assert.equal(s.status,"complete");
});
test("incorrect letter cannot advance",()=>{
 let s=selectLetter(createGame(),"p").state;
 assert.equal(s.selection,"");assert.equal(s.mistakes,1);
});
test("cannot skip an unfinished level",()=>{
 assert.equal(advance(createGame()).event,"not-ready");
});
test("two word sequence finishes",()=>{
 let s=createGame();for(const c of "cat")s=selectLetter(s,c).state;
 s=advance(s).state;for(const c of "sun")s=selectLetter(s,c).state;
 assert.equal(advance(s).state.status,"finished");
});
test("reset returns initial state",()=>assert.deepEqual(restart(),createGame()));
