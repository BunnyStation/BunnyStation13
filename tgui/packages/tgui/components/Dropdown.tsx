import { classes } from 'common/react';
import { ReactNode, useCallback, useEffect, useRef, useState } from 'react';

import { Box, BoxProps } from './Box';
import { Button } from './Button';
import { Icon } from './Icon';
import { Popper } from './Popper';

type DropdownEntry = {
  displayText: ReactNode;
  value: string | number;
};

type DropdownOption = string | DropdownEntry;

type Props = {
  options: DropdownOption[];
  onSelected: (selected: any) => void;
} & Partial<{
  buttons: boolean;
  clipSelectedText: boolean;
  color: string;
  disabled: boolean;
  displayText: ReactNode;
  icon: string;
  iconRotation: number;
  iconSpin: boolean;
  menuWidth: string;
  noChevron: boolean;
  onClick: (event) => void;
  over: boolean;
  selected: string | number;
}> &
  BoxProps;

function getOptionValue(option: DropdownOption) {
  return typeof option === 'string' ? option : option.value;
}

export function Dropdown(props: Props) {
  const {
    buttons,
    className,
    clipSelectedText = true,
    color = 'default',
    disabled,
    displayText,
    icon,
    iconRotation,
    iconSpin,
    menuWidth = '15rem',
    noChevron,
    onClick,
    onSelected,
    options = [],
    over,
    selected,
    width,
  } = props;

  const [open, setOpen] = useState(false);
  const adjustedOpen = over ? !open : open;

  /** Get the index of the selected option */
  function getSelectedIndex() {
    return options.findIndex((option) => {
      return getOptionValue(option) === selected;
    });
  }

      onSelected?.(getOptionValue(options[newIndex]));
    },
    [disabled, onSelected, options, selected],
  );

  /** Allows the menu to be scrollable on open */
  useEffect(() => {
    if (!open) return;

    innerRef.current?.focus();
  }, [open]);

  return (
    <Popper
      isOpen={open}
      onClickOutside={() => setOpen(false)}
      placement={over ? 'top-start' : 'bottom-start'}
      content={
        <div
          className="Layout Dropdown__menu"
          style={{ minWidth: menuWidth }}
          ref={innerRef}
        >
          {options.length === 0 && (
            <div className="Dropdown__menuentry">No options</div>
          )}

          {options.map((option, index) => {
            const value = getOptionValue(option);

            return (
              <div
                className={classes([
                  'Dropdown__menuentry',
                  selected === value && 'selected',
                ])}
                id="dropdown-item"
                key={value}
                onClick={() => {
                  setOpen(false);
                  onSelected?.(value);
                }}
              >
                {typeof option === 'string' ? option : option.displayText}
              </div>
            );
          })}
        </div>
      }
    >
      <Box className="Dropdown" width={width}>
        <div
          className={classes([
            'Dropdown__control',
            'Button',
            'Button--dropdown',
            'Button--color--' + color,
            disabled && 'Button--disabled',
            className,
          ])}
          onClick={(event) => {
            if (disabled && !open) {
              return;
            }
            setOpen(!open);
            onClick?.(event);
          }}
        >
          {icon && (
            <Icon mr={1} name={icon} rotation={iconRotation} spin={iconSpin} />
          )}
          <span
            className="Dropdown__selected-text"
            style={{
              overflow: clipSelectedText ? 'hidden' : 'visible',
            }}
          >
            {displayText || selected}
          </span>
          {!noChevron && (
            <span className="Dropdown__arrow-button">
              <Icon name={adjustedOpen ? 'chevron-up' : 'chevron-down'} />
            </span>
          )}
        </div>
      </div>
    </Popper>
  );
}
