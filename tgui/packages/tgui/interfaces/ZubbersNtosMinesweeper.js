import { MinesweeperContent } from './ZubbersMinesweeper.js';
import { NtosWindow } from '../layouts';

export const ZubbersNtosMinesweeper = (props, context) => {
  return (
    <NtosWindow width={600} height={572}>
      <NtosWindow.Content>
        <MinesweeperContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
