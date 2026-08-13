import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    {
      text: 'About',
      href: getPermalink('/'),
    },
    {
      text: 'Members',
      href: getPermalink('/members'),
    },
    {
      text: 'Research',
      href: getPermalink('/research'),
    },
    {
      text: 'Publications',
      href: getPermalink('/publications'),
    },
  ],
  actions: [],
};

export const footerData = {
  links: [
    {
      title: 'Navigate',
      links: [
        { text: 'About', href: getPermalink('/') },
        { text: 'Members', href: getPermalink('/members') },
        { text: 'Research', href: getPermalink('/research') },
        { text: 'Publications', href: getPermalink('/publications') },
      ],
    },
    {
      title: 'Contact',
      links: [
        { text: 'Bob Frank', href: 'mailto:bob.frank@yale.edu' },
        { text: 'Tom McCoy', href: 'mailto:tom.mccoy@yale.edu' },
      ],
    },
  ],
  secondaryLinks: [],
  socialLinks: [],
  footNote: `Computational Linguistics at Yale (CLAY Lab)`,
};
